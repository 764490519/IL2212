module Lab1_7 where

import ForSyDe.Shallow

system s_in = (s_out_x, s_out_y)
  where
    s_1 = adder s_in s_out_x
    s_2 = multiply_2 s_1
    s_3 = adder s_2 s_out_y
    s_out_y = add_1 s_in
    s_out_x = delaySY 0 s_3

adder = zipWithSY (+)

add_1 = actor11SDF 1 1 (\[x] -> [x + 1])

multiply_2 = actor11SDF 1 1 (\[x] -> [2 * x])