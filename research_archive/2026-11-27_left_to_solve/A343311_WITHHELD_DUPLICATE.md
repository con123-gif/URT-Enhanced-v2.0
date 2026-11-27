# A343311: official proof submission withheld

Our canonical full iff proof passed the exact imported-target official checker on the fork (run46050535637/job140680437329, commit76ef8db805256813fc213d2388728e5e5af867d0), with only propext, Classical.choice, and Quot.sound. No valid new proof lease was obtained: supported local and coordinated secure POST/GET requests returned HTTP500. No official proof PR was created by us.

A later full proof PR10512 by treybeathard-jpg was independently fetched and read in full. Its sole file imports the exact registered statement and proves `type_of% @OMA.S_oeis_a343311.main`, retaining the whole iff, positivity, pairwise distinctness, compositeness, and all four exceptions. Its mathematical argument includes the prime obstruction, exceptional obstructions, even-number witnesses, and odd factor/square constructions. It is a complete competing submission in scope.

At this observation it is OPEN and UNMERGED. The official Lean check is QUEUED, so kernel acceptance is not claimed. Automated Codex review was unavailable because of service review limits; that is separate from the mathematical checker. Its author reports a local Lean4.34 pass and defers the exact4.33.1 check to CI.

The campaign is withholding a duplicate official submission and recording its already verified independent certificate without a copying or priority allegation. The existing registered statement PR9126 remains our contribution.

Current safe metadata follows.

```json
{
  "number": 10512,
  "url": "https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/10512",
  "author": "treybeathard-jpg",
  "state": "open",
  "merged_at": null,
  "head": "195c97e0fdc0527d07f2cecaf6f41692fc9a10e5",
  "created_at": "2026-11-27T18:48:43Z",
  "full_target": true,
  "files": [
    {
      "path": "proofs/oeis-a343311.lean",
      "additions": 140,
      "deletions": 0
    }
  ],
  "checks": [
    {
      "name": "check",
      "status": "queued",
      "conclusion": null,
      "details_url": "https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46052206775/job/140686044731"
    }
  ]
}
```
