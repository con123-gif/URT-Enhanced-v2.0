#!/usr/bin/env python3
"""Restore an authenticated native cache from the known Actions artifact ZIP.

Verify the outer artifact digest, inner archive digest, source pins and every
archive path. Replace only this checkout's native import cache, retaining its
previous directory for rollback. Restoring artifacts is not proof execution.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import tarfile
import tempfile

import run_compact_b2_native_replay as native


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--artifact", required=True, type=Path)
    p.add_argument("--artifact-sha256", required=True)
    p.add_argument("--compact-root", required=True, type=Path)
    p.add_argument("--out", required=True, type=Path)
    args = p.parse_args()
    root, out = args.compact_root.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    native.require(digest(args.artifact) == args.artifact_sha256,
                   "Actions ZIP digest mismatch")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                   "Wrong destination source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"],
                   root / ".lake/packages/mathlib") == native.MATHLIB, "Wrong destination Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    import zipfile
    with zipfile.ZipFile(args.artifact) as archive:
        def one(suffix):
            matches = [n for n in archive.namelist() if n.endswith(suffix)]
            native.require(len(matches) == 1, "Missing/ambiguous cache artifact member: " + suffix)
            return matches[0]
        manifest = json.loads(archive.read(one("outputs/native_cache_manifest.json")))
        native.require(manifest["compact"] == native.PIN and manifest["mathlib"] == native.MATHLIB,
                       "Wrong archive source pins")
        native.require(manifest["lean_release_sha256"] == native.RELEASE,
                       "Wrong archive Lean release")
        native.require(manifest["archive"] == "native_b2_oleans.tar.zst" and
                       manifest["archive_result"]["returncode"] == 0,
                       "Native cache was not archived successfully")
        native.require(manifest["proof_receipt"] is False,
                       "Unexpected cache manifest semantics")
        packed = out / manifest["archive"]
        with archive.open(one("outputs/" + packed.name)) as src, packed.open("wb") as dest:
            shutil.copyfileobj(src, dest)
    native.require(digest(packed) == manifest["sha256"] and packed.stat().st_size == manifest["bytes"],
                   "Inner native archive digest/size mismatch")
    build = root / ".lake/build"
    build.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix="verified_b2_cache_", dir=build))
    prefix = (".lake", "build", "lib", "lean")
    total = count = 0
    errors = out / "cache_decompression.log"
    with errors.open("wb") as log:
        proc = subprocess.Popen(["zstd", "-dc", str(packed)], stdout=subprocess.PIPE, stderr=log)
        try:
            with tarfile.open(fileobj=proc.stdout, mode="r|") as archive:
                for member in archive:
                    rel = PurePosixPath(member.name)
                    native.require(not rel.is_absolute() and ".." not in rel.parts and
                                   rel.parts[:4] == prefix, "Unexpected native archive path")
                    dest = stage.joinpath(*rel.parts[4:])
                    native.require(dest.resolve().is_relative_to(stage.resolve()),
                                   "Native cache path escaped staging directory")
                    if member.isdir():
                        dest.mkdir(parents=True, exist_ok=True)
                    else:
                        native.require(member.isfile(), "Native archive contains a link/special file")
                        total += member.size
                        native.require(total <= 3_000_000_000, "Native cache exceeds restore budget")
                        dest.parent.mkdir(parents=True, exist_ok=True)
                        with archive.extractfile(member) as src, dest.open("wb") as target:
                            shutil.copyfileobj(src, target)
                        count += 1
            native.require(proc.wait(timeout=30) == 0, "Native cache decompression failed")
        finally:
            if proc.poll() is None:
                proc.kill()
                proc.wait()
    native.require(count > 0, "Native cache archive is empty")
    modules = {name: (stage / (name.replace(".", "/") + ".olean")).is_file()
               for name in ["New.Filling.BlockBound", "New.Filling.CrudeEnergy"]}
    if manifest["source_build_complete"]:
        native.require(modules["New.Filling.CrudeEnergy"],
                       "Complete cache manifest is missing its target module")
    target = build / "lib/lean"
    native.require(not target.is_symlink(), "Destination native cache is a symlink")
    target.parent.mkdir(parents=True, exist_ok=True)
    backup = None
    if target.exists():
        backup = build / ("previous_native_lib_" + stage.name)
        target.rename(backup)
    try:
        stage.rename(target)
    except BaseException:
        if backup is not None and not target.exists():
            backup.rename(target)
        raise
    result = {"compact": native.PIN, "mathlib": native.MATHLIB,
              "artifact_sha256": args.artifact_sha256, "inner_sha256": manifest["sha256"],
              "source_build_complete": manifest["source_build_complete"],
              "modules_available": modules,
              "restored_files": count, "restored_bytes": total,
              "previous_cache": str(backup) if backup is not None else None,
              "new_Lean_execution": False, "proof_receipt": False, "full_RH_replay": False}
    native.dump(out / "cache_restore_results.json", result)
    print(json.dumps(result))


if __name__ == "__main__":
    main()
