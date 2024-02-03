module Lab1_4_Switch where

import ForSyDe.Shallow

switch s_in c_in = (s_out_1, s_out_2)
  where
    (s_out_1, s_out_2) = k_1 c_1 s_in
    c_1 = d_1 c_in

k_1 = kernel12SADF

d_1 = detector11SADF 1 next_state select_scenario 0

k_1_scenario_0 = (1, (0, 1), \[x] -> ([], [x]))

k_1_scenario_1 = (1, (1, 0), \[x] -> ([x], []))

select_scenario 0 = (1, [k_1_scenario_0])
select_scenario 1 = (1, [k_1_scenario_1])

next_state _ [True] = 1
next_state _ [False] = 0
