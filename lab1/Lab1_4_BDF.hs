module Lab1_4_BDF where

import ForSyDe.Shallow

select s_in_1 s_in_2 c_in = s_out
  where
    s_out = k_select c_1 s_in_1 s_in_2
    c_1 = d_select c_in

k_select = kernel21SADF

d_select = detector11SADF 1 next_state select_scenario 0

select_scenario_0 = ((0, 1), 1, \[] [y] -> ([y]))

select_scenario_1 = ((1, 0), 1, \[x] [] -> ([x]))

select_scenario 0 = (1, [select_scenario_0])
select_scenario 1 = (1, [select_scenario_1])

next_state _ [True] = 1
next_state _ [False] = 0

switch s_in c_in = (s_out_1, s_out_2)
  where
    (s_out_1, s_out_2) = k_switch c_1 s_in
    c_1 = d_switch c_in

k_switch = kernel12SADF

d_switch = detector11SADF 1 next_state switch_scenario 0

switch_scenario_0 = (1, (0, 1), \[x] -> ([], [x]))

switch_scenario_1 = (1, (1, 0), \[x] -> ([x], []))

switch_scenario 0 = (1, [switch_scenario_0])
switch_scenario 1 = (1, [switch_scenario_1])

system s_a s_b = s_e
  where
    (s_1, s_2) = switch s_a s_b
    s_3 = actor_c s_1
    s_4 = actor_d s_2
    s_e = select s_3 s_4 s_b

actor_c = actor11SDF 1 1 (\[x] -> [x])

actor_d = actor11SDF 1 1 (\[x] -> [-x])
