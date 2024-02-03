-- stack ghci --package forsyde-shallow

-- :m +ForSyDe.Shallow
-- :l GettingStarted.hs

module SDF_Intro where

import ForSyDe.Shallow (actor11SDF, actor22SDF, delaySDF, signal)

-- Netlist
system s_in = s_out
  where
    (s_1, s_2) = a_1 s_in s_3
    s_3 = d_1 s_2
    s_out = a_2 s_1

-- Process specification
a_1 s1 s2 = actor22SDF (1, 1) (1, 1) add s1 s2

d_1 s = delaySDF [0] s

a_2 s = actor11SDF 3 1 average s

-- Function definition
add [x] [y] = ([x + y], [x + y])

average [x1, x2, x3] = [(x1 + x2 + x3) / 3.0]

-- Test Signal
s_test = signal [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
