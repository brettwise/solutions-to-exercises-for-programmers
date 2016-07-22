defmodule TipCalcTest do
  use ExUnit.Case
  doctest TipCalc

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "find tip amount" do
    assert TipCalc.calc_tip(20, 25.53) == 5.11
  end

  test "if decimal tips are just used in calculation instead of being divided" do
    assert TipCalc.calc_tip(0.15, 25.53) == 3.83
  end
end
