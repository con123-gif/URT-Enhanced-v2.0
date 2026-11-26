#!/usr/bin/env python3
"""Expand successful RUN28 bounded replay to the actual A/B/C primitives.
RUN28 status: pass, 912.12 seconds, run 45799225653.
No whole-RH replay, no proof of new human replacements by importing native ones.
"""
import RUN28_COMPACT_TARGETED as replay

replay.PEERS = {}
replay.TARGETS = [
    ("New.Selmer.TiltingLemma", "62784266136a2936dd6f8d662b79fa051d28c470",
        ["IsPencil.length_le_of_unseen_class", "tilting", "IsPencil.length_le_of_drop_ties"]),
    ("New.Columns.JetExponentBound", "bedef08c7c1707f74e9afce0c8008b88ba37dc8a",
        ["Data.le_jetExponent", "Data.IsMarked.sum_lowColumns_le", "Data.mul_collisionSum_le_loss"]),
    ("New.Filling.Moments", "ec2cb964ede0d5eeae41a077dc6dbfface9c0444",
        ["Filling.energy_fixingSet_le", "Filling.sum_le_of_positive_type", "Filling.Fits.exists_translate_finrank_comap_le"]),
]

if __name__ == "__main__":
    replay.main()
