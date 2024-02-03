module Lab1_5 where

import ForSyDe.Shallow

system s_in = s_out
  where
    s_out = k_1 c_1 s_in
    c_1 = d_1 c_in
    c_in = delaySY 0 s_out

k_1 = kernel11SADF

d_1 = detector11SADF 1 next_state select_scenario 0

k_1_scenario_0 = (3, 1, \[a, b, c] -> [a + b + c])

k_1_scenario_1 = (2, 1, \[a, b] -> [a + b])

select_scenario 0 = (1, [k_1_scenario_0])
select_scenario 1 = (1, [k_1_scenario_1])

next_state 0 [x] | x > 20 = 1
next_state 0 [x] | x <= 20 = 0
next_state 1 [x] | x < 10 = 0
next_state 1 [x] | x >= 10 = 1
