#!/usr/bin/env bash
set -euo pipefail

# Run from a clean checkout of con123-gif/URT-Enhanced-v2.0 on branch newtons-cathedral.
git checkout newtons-cathedral
git pull --ff-only

git switch -c consolidate-2026-10-01

# Preserve both secondary repositories in prefixed subtrees.
git subtree add --prefix=experiments/lytolllis-chaos-lab \
  https://github.com/con123-gif/lytolllis-chaos-lab.git main --squash

git subtree add --prefix=legacy/repositories/Newtons-cathedral- \
  https://github.com/con123-gif/Newtons-cathedral-.git main --squash

# Clean generated and redundant payloads from imported trees.
rm -rf experiments/lytolllis-chaos-lab/src/__pycache__
rm -f legacy/repositories/Newtons-cathedral-/URT-Enhanced-v2.0-newtons-cathedral.zip

# Keep all existing canonical files; copy the current full project archive overlay into research_archive/full_project_snapshot.
mkdir -p research_archive/full_project_snapshot
find . -maxdepth 1 -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.pdf' -o -name '*.zip' -o -name '*.bundle' -o -name '*.npz' -o -name '*.csv' -o -name '*.json' -o -name '*.txt' -o -name '*.md' -o -name '*.py' -o -name '*.patch' \) -print0 \
  | xargs -0 -I{} cp -n "{}" research_archive/full_project_snapshot/ || true

# Late-September files are already organized under docs/ and verification/ in this bundle.

git add -A
git commit -m "Consolidate Cathedral repositories and complete project archive"

git push -u origin consolidate-2026-10-01

echo "Open a PR from consolidate-2026-10-01 to newtons-cathedral, review, then merge."