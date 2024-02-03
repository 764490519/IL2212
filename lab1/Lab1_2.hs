module Lab1_2 where

import ForSyDe.Shallow

system s_in = (s_out1, s_out2)
  where
    s_out1 = a_2 s_1
    s_out2 = a_3 s_2
    (s_1, s_2) = a_1 s_in

    a_1 = actor12SDF 2 (1, 1) switch where
    switch [x, y] = ([x], [y])

    -- SDF actor 'a_2' that implements identity function
    a_2 = actor11SDF 1 1 (\[x] -> [x])

    -- SDF actor 'a_3' that implements negation function
    a_3 = actor11SDF 1 1 (\[x] -> [-x])
