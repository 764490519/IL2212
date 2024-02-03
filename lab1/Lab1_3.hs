module Lab1_3 where

import ForSyDe.Shallow

system s_in = (s_out_1, s_out_2)
  where
    (s_out_1, s_out_2) = k_1 c_1 s_in
    c_1 = d_1 s_in

k_1 = kernel12SADF

d_1 = detector11SADF 1 next_state select_scenario 0

k_1_scenario_0 = (1, (1, 0), \[x] -> ([x], []))

k_1_scenario_1 = (1, (0, 1), \[x] -> ([], [-x]))

select_scenario 0 = (1, [k_1_scenario_0])
select_scenario 1 = (1, [k_1_scenario_1])

next_state 0 _ = 1
next_state 1 _ = 0
