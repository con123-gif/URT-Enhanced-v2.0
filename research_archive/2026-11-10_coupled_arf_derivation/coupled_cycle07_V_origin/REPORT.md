# Coupled cycle 07 — origin of the printed V coefficients

Classification: OPEN.
Advances an ARF? No.

The printed digits `0.490435304391`, `4.16132699108e-7` and
`1.961741217564` were searched for in:

- `git log -S` (pickaxe) on every commit of every branch;
- `git grep` over all 650 commits;
- the working tree, including `research_archive`, `drive_archive`,
  backups and every `*.ipynb` Colab notebook;
- nearby formats `0.490435`, `4.161326`, `1.961741`, `490435304391`.

The clone has a single branch, `newtons-cathedral`. No commit, notebook
or archive file outside this programme contains those digits. The only
working-tree hits were this programme's own cycle-02/05 reports and
`alt_cycle08_adversarial`, which quotes the same user-supplied numbers as
a test polynomial and is not an independent origin.

The coefficients therefore remain an external printed figure. Cycle 02's
discrepancy report (nearest Iico axis `(0,0)` off by 1.813% and 2.278%)
is unchanged: there is still no archived convention to replay.

Verification: `test_V_origin.py`, `results.json`.
Predeclaration hash: `6e81dd8810b149f193623001251aff699d2d22760f942d639f06504dd57f5318`
