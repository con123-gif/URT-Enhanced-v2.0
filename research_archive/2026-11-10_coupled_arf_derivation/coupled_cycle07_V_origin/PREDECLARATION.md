# Coupled cycle 07 predeclaration — origin of the printed V coefficients

Search, without changing any operator, for the source of the printed
numbers 0.490435304391 and 4.16132699108e-7 (and the mixed derivative
1.961741217564).

Search list, fixed now:

1. git log -S and git grep over every commit of every branch of the
   cloned URT-Enhanced-v2.0 repository.
2. The working tree, including research_archive, drive_archive, backups
   and Colab notebooks (*.ipynb).
3. Nearby numerical formats: 0.490435, 490435304391, 4.161326, 1.961741,
   "t^2 f^2", "t2f2", "mixed derivative".
4. If a source file is found, re-execute its convention and report
   whether it reproduces the printed digits or an exact discrepancy.
5. If no source is found, state that fact and list what was searched.

No coefficient will be adjusted to manufacture a match. Classification:
PROVED (origin located and reproduced, or located with a documented
discrepancy); OPEN if the digits cannot be found in the repository
family searched here.
