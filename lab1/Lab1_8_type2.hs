module Lab1_8_type2 where

import ForSyDe.Shallow

data Coin = C5 | C10 deriving (Show, Eq, Ord)

data Bottle = B deriving (Show, Eq, Ord)

data Return = R deriving (Show, Eq, Ord)

type Coin_Event = AbstExt Coin

type Bottle_Event = AbstExt Bottle

type Return_Event = AbstExt Return

vendingMachine ::
  Signal Coin_Event -> -- Signal of Coins
  Signal (Bottle_Event, Return_Event) -- Signal of (Bottle, Return)
vendingMachine coins = zipWithSY (,) sout_bottle sout_return
  where
    (sout_bottle, sout_return) = k_1 c_in coins
    c_in = d_1 coins

k_1 = kernel12SADF

d_1 = detector11SADF 1 next_state select_scenario 0

scenario_0 = (1, (1, 1), \_ -> ([Abst], [Abst])) -- give nothing

scenario_1 = (1, (1, 1), \_ -> ([Prst B], [Abst])) -- give bottle

scenario_2 = (1, (1, 1), \_ -> ([Prst B], [Prst R])) -- give bottle and return

select_scenario 0 = (1, [scenario_0]) -- 0 coins remain
select_scenario 1 = (1, [scenario_1]) -- 0 coins remain
select_scenario 2 = (1, [scenario_2]) -- 0 coins remain
select_scenario 3 = (1, [scenario_0]) -- 5 coins remain
select_scenario 4 = (1, [scenario_1]) -- 5 coins remain

next_state state [Abst] | state == 0 || state == 1 || state == 2 = 0
next_state state [Prst C10] | state == 0 || state == 1 || state == 2 = 1
next_state state [Prst C5] | state == 0 || state == 1 || state == 2 = 3
next_state state [Abst] | state == 3 || state == 4 = 3
next_state state [Prst C10] | state == 3 || state == 4 = 2
next_state state [Prst C5] | state == 3 || state == 4 = 1