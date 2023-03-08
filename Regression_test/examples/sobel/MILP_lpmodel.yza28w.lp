Maximize
  NxS_e0 + NxS_e1 + NxS_e3 + NxS_e11 + NxS_e12 + NxS_e14
Subject to
  -S_BB_1 + S_e_0 = 0
  -S_BB_1 = 0
  -S_BB_2 + S_e_1 = 0
  -S_BB_2 + S_e_0 = 0
  -S_BB_3 + S_e_3 = 0
  -S_BB_3 + S_e_1 + S_e_11 = 0
  -S_BB_4 = 0
  -S_BB_4 = 0
  -S_BB_5 = 0
  -S_BB_5 = 0
  -S_BB_6 = 0
  -S_BB_6 = 0
  -S_BB_7 = 0
  -S_BB_7 = 0
  -S_BB_8 = 0
  -S_BB_8 = 0
  -S_BB_9 + S_e_11 + S_e_12 = 0
  -S_BB_9 + S_e_3 = 0
  -S_BB_10 + S_e_14 = 0
  -S_BB_10 + S_e_12 = 0
  -S_BB_11 = 0
  -S_BB_11 + S_e_14 = 0
  NxS_e0 - N <= 0
  -16 S_e_0 + NxS_e0 <= 0
  -16 S_e_0 + NxS_e0 - N >= -16
  -15 S_e_0 - N >= -16
  NxS_e1 - N <= 0
  -16 S_e_1 + NxS_e1 <= 0
  -16 S_e_1 + NxS_e1 - N >= -16
  -15 S_e_1 - N >= -16
  NxS_e3 - N <= 0
  -16 S_e_3 + NxS_e3 <= 0
  -16 S_e_3 + NxS_e3 - N >= -16
  -N >= -16
  NxS_e11 - N <= 0
  -16 S_e_11 + NxS_e11 <= 0
  -16 S_e_11 + NxS_e11 - N >= -16
  -S_e_11 - N >= -16
  NxS_e12 - N <= 0
  -16 S_e_12 + NxS_e12 <= 0
  -16 S_e_12 + NxS_e12 - N >= -16
  -15 S_e_12 - N >= -16
  NxS_e14 - N <= 0
  -16 S_e_14 + NxS_e14 <= 0
  -16 S_e_14 + NxS_e14 - N >= -16
  -15 S_e_14 - N >= -16
  S_e_11 = 1
Bounds
  0 <= NxS_e0 <= 1
  0 <= NxS_e1 <= 1
  0 <= NxS_e3 <= 16
  0 <= NxS_e11 <= 15
  0 <= NxS_e12 <= 1
  0 <= NxS_e14 <= 1
  0 <= N <= 16
General
  N
Binary
  S_BB_1 S_BB_2 S_BB_3 S_BB_4 S_BB_5 S_BB_6 S_BB_7 S_BB_8 S_BB_9 S_BB_10 S_BB_11 S_e_0 S_e_1 S_e_3 S_e_11 S_e_12 S_e_14
End
