module Lab1_4_Select where

import ForSyDe.Shallow

select s_in_1 s_in_2 c_in = s_out
  where
    s_out = k_1 c_1 s_in_1 s_in_2
    c_1 = d_1 c_in

k_1 = kernel21SADF

d_1 = detector11SADF 1 next_state select_scenario 0

k_1_scenario_0 = ((0, 1), 1, \[] [y] -> ([y]))

k_1_scenario_1 = ((1, 0), 1, \[x] [] -> ([x]))

select_scenario 0 = (1, [k_1_scenario_0])
select_scenario 1 = (1, [k_1_scenario_1])

next_state _ [True] = 1
next_state _ [False] = 0
