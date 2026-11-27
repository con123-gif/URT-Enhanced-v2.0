#!/usr/bin/env python3
"""Byte-preserving archive input for the unchanged random-access graph auditor.

Keep one projected root on disk at a time. The original union is gzip archived,
verified byte for byte by SHA256, then read through an immutable memory buffer.
No record, root traversal or independent verifier is modified.
"""
import gzip
import hashlib
import io
from pathlib import Path

import run_compact_b2_native_replay as native


class MemoryGraph:
    def __init__(self, data):
        self.data = data

    def open(self, mode="rb"):
        native.require(mode == "rb", "Archived graph is read-only binary input")
        return io.BytesIO(self.data)


def archive_before_audit(path):
    raw = Path(path)
    packed = raw.with_name(raw.name + ".gz")
    digest = hashlib.sha256()
    size = 0
    with raw.open("rb") as source, gzip.open(packed, "wb", compresslevel=6) as target:
        for chunk in iter(lambda: source.read(1048576), b""):
            digest.update(chunk)
            size += len(chunk)
            target.write(chunk)
    with gzip.open(packed, "rb") as stream:
        data = stream.read()
    native.require(len(data) == size and hashlib.sha256(data).digest() == digest.digest(),
                   "Archived graph changed its decompressed bytes")
    with packed.open("rb") as stream:
        archive_hash = hashlib.file_digest(stream, "sha256").hexdigest()
    native.dump(raw.parent / "graph_archive_receipt.json", {
        "raw_name": raw.name, "raw_bytes": size, "raw_sha256": digest.hexdigest(),
        "archive_name": packed.name, "archive_bytes": packed.stat().st_size,
        "archive_sha256": archive_hash, "decompressed_sha256_verified": True,
        "raw_removed_after_verification": True,
        "projection_input": "same bytes in read-only seekable memory; independent verifier unchanged",
        "full_RH_replay": False})
    raw.unlink()
    return MemoryGraph(data)
