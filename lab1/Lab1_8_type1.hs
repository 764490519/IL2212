module Lab1_8_type1 where

import ForSyDe.Shallow

vendingMachine ::
  Signal Bool -> -- Signal of 5 SEK coins
  Signal Bool -> -- Signal of 10 SEK coins
  Signal (Bool, Bool) -- Signal of(Bottle, Return)
vendingMachine sin_5 sin_10 = zipWithSY (,) sout_bottle sout_return
  where
    (sout_bottle, sout_return) = k_1 c_in sin_5 sin_10
    c_in = d_1 sin_5 sin_10

k_1 = kernel22SADF

d_1 = detector21SADF (1, 1) next_state select_scenario 0

scenario_0 = ((1, 1), (1, 1), \_ _ -> ([False], [False])) -- give nothing

scenario_1 = ((1, 1), (1, 1), \_ _ -> ([True], [False])) -- give bottle

scenario_2 = ((1, 1), (1, 1), \_ _ -> ([True], [True])) -- give bottle and return

select_scenario 0 = (1, [scenario_0]) -- 0 coins remain
select_scenario 1 = (1, [scenario_1]) -- 0 coins remain
select_scenario 2 = (1, [scenario_2]) -- 0 coins remain
select_scenario 3 = (1, [scenario_0]) -- 5 coins remain
select_scenario 4 = (1, [scenario_1]) -- 5 coins remain

next_state state [False] [False] | state == 0 || state == 1 || state == 2 = 0
next_state state [False] [True] | state == 0 || state == 1 || state == 2 = 1
next_state state [True] [True] | state == 0 || state == 1 || state == 2 = 2
next_state state [True] [False] | state == 0 || state == 1 || state == 2 = 3
next_state state [False] [False] | state == 3 || state == 4 = 3
next_state state [False] [True] | state == 3 || state == 4 = 2
next_state state [True] [False] | state == 3 || state == 4 = 1
next_state state [True] [True] | state == 3 || state == 4 = 0
