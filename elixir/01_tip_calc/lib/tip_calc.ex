defmodule TipCalc do
  def main(argv) do
    {[bill_amount: bill_amount, tip_percentage: tip_percentage], _, _} = OptionParser.parse(argv,
      switches: [bill_amount: :float, tip_percentage: :integer],
      aliases: [ba: :bill_amount, tp: :tip_percentage] # makes '-q' an alias of '--question'
      )

      IO.puts "So your bill is: #{bill_amount}"
      IO.puts "And you're tipping out at #{tip_percentage}%"
      IO.puts "which is: $#{calc_tip(tip_percentage, bill_amount)}"
      IO.puts "for a total of: $#{calc_total(tip_percentage, bill_amount)}"
  end

  def calc_tip(tip_percentage, bill_amount) when tip_percentage > 1 do
    tip_percentage / 100 * bill_amount
    |> Float.round(2)
  end

  def calc_tip(tip_percentage, bill_amount) do
    tip_percentage * bill_amount
    |> Float.round(2)
  end

  def calc_total(tip_percentage, bill_amount) do
    calc_tip(tip_percentage, bill_amount) + bill_amount
    |> Float.round(2)
  end

end
