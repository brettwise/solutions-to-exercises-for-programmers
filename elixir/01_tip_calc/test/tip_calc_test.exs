defmodule TipCalcTest do
  use ExUnit.Case, async: true
  doctest TipCalc

  # test "find tip amount" do
  #   assert TipCalc.calc_tip(20, 25.53) == 5.11
  # end
  #
  # test "if decimal tips are just used in calculation instead of being divided" do
  #   assert TipCalc.calc_tip(0.15, 25.53) == 3.83
  # end
end
