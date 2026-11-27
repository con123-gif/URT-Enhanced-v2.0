"""Temporary graph files in memory; the exporter and validators stay unchanged.

Use Linux memory file descriptors when scratch cannot hold a native inspector
and complete per-root projections together. Verify the original executable
bytes before running them, and retain a checked gzip of the actual graph.
"""
from contextlib import contextmanager
import gzip
import hashlib
import os
from pathlib import Path
import shutil


def sha(path):
    with Path(path).open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


@contextmanager
def memory_file(name, executable=False):
    fd = os.memfd_create(name, flags=0)
    try:
        os.fchmod(fd, 0o700 if executable else 0o600)
        yield Path(f"/proc/{os.getpid()}/fd/{fd}")
    finally:
        os.close(fd)


@contextmanager
def memory_exporter(original, destination, archive, expected_sha):
    original, destination = Path(original), Path(destination)
    destination.mkdir(parents=True, exist_ok=True)
    names = ["NativeGraph.lean", "native_graph_build.json", "compile_result.json",
             "link_result.json", "core_equivalence_results.json",
             "core_interpreted_result.json", "core_native_result.json"]
    for name in names:
        target = destination / name
        if target.exists():
            if target.read_bytes() != (original / name).read_bytes():
                raise ValueError("Changed exporter metadata")
        else:
            shutil.copyfile(original / name, target)
    link = destination / "native_graph"
    if link.exists() or link.is_symlink():
        raise ValueError("Memory executable destination already exists")
    with memory_file("checked-native-inspector", executable=True) as binary:
        with gzip.open(archive, "rb") as source, binary.open("wb") as target:
            shutil.copyfileobj(source, target)
        if sha(binary) != expected_sha:
            raise ValueError("Archived native executable failed its original digest")
        link.symlink_to(binary)
        try:
            yield destination
        finally:
            link.unlink()


def audit_in_memory(graph_module, graph_input, out, roots):
    """Call the original auditor/Node verifier with unchanged file contents."""
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    work = out / "projections"
    work.mkdir(exist_ok=True)
    links = []
    graph_module.ROOTS = list(roots)
    with memory_file("root-projection") as projection:
        try:
            for i in range(len(roots)):
                link = work / f"root-{i}.jsonl"
                if link.exists() or link.is_symlink():
                    raise ValueError("Projection path already exists")
                link.symlink_to(projection)
                links.append(link)
            graph_module.audit_union(Path(graph_input), out, work)
        finally:
            for link in links:
                if link.is_symlink() and os.readlink(link) == str(projection):
                    link.unlink()


def archive_graph(graph_input, target):
    graph_input, target = Path(graph_input), Path(target)
    raw_sha, raw_bytes = sha(graph_input), graph_input.stat().st_size
    with graph_input.open("rb") as source, gzip.open(target, "wb", compresslevel=6) as dest:
        shutil.copyfileobj(source, dest)
    with gzip.open(target, "rb") as stream:
        if hashlib.file_digest(stream, "sha256").hexdigest() != raw_sha:
            raise ValueError("Saved compressed graph failed exact decompression check")
    return {"raw_bytes": raw_bytes, "raw_sha256": raw_sha,
            "gzip_bytes": target.stat().st_size, "gzip_sha256": sha(target),
            "archive": str(target), "exact_decompression_verified": True}
