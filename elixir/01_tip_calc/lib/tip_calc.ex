defmodule TipCalc do
  def main(argv) do
    {[bill_amount: bill_amount, tip_percentage: tip_percentage], _, _} = OptionParser.parse(argv,
      switches: [bill_amount: :float, tip_percentage: :integer],
      aliases: [ba: :bill_amount, tp: :tip_percentage] # makes '-q' an alias of '--question'
      )

    tip_float = parse_number(tip_percentage) / 100
    bill_amount = parse_number(bill_amount)
    tip_amount = calc_tip(tip_float, bill_amount)
    bill_total = calc_total(tip_amount, bill_amount)
    print_to_CLI(bill_amount, tip_percentage, tip_amount, bill_total)
  end

  @doc """
  Takes a number in and checks if it's positive. If it is it's floated. If already a float it's returned.

      iex> TipCalc.parse_number(15)
      15.0

      iex> TipCalc.parse_number(-1)
      "You'll have to enter a positive number for this to work."
      :ok

  """
  def parse_number(number) do
    case number do
      number when number < 0 ->
        IO.puts "You'll have to enter a positive number for this to work."
      number when is_integer(number) ->
        number / 1
      number when is_float(number) ->
        number
    end
  end

  @doc """
  Calculates the tip amount. Takes two floats and returns a rounded number.

      iex> TipCalc.calc_tip(0.15, 55.12)
      8.27
  """
  def calc_tip(tip_percentage, bill_amount) do
    tip_percentage * bill_amount
    |> Float.round(2)
  end

  @doc """
  Calculates the total bill amount. Takes floats.

      iex> TipCalc.calc_total(2.0, 4.32)
      6.32
  """
  def calc_total(tip_amount, bill_amount) do
    tip_amount + bill_amount
    |> Float.round(2)
  end

  @doc """
  Prints 4 values to the command line: the bill amount, tip percentage, tip amount, and total bill amount.
  """
  def print_to_CLI(bill_amount, tip_percentage, tip_amount, bill_total)  do
    IO.puts "So your bill is: $#{bill_amount}"
    IO.puts "And you're tipping out at #{tip_percentage}%"
    IO.puts "which is: $#{tip_amount}"
    IO.puts "for a total of: $#{bill_total}"
  end
end
