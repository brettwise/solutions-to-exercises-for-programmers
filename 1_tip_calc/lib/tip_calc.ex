defmodule TipCalc do

  def calc_tip(tip_percentage, bill) when tip_percentage > 1 do
    tip_percentage / 100 * bill
    |> Float.round(2)
  end

  def calc_tip(tip_percentage, bill) do
    tip_percentage * bill
    |> Float.round(2)
  end

  def calc_total(tip_amount, bill) do
    tip_amount + bill
    |> Float.round(2)
  end

end
