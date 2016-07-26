defmodule TipCalc do
  def main(argv) do
    {[bill_amount: bill_amount, tip_percentage: tip_percentage], _, _} = OptionParser.parse(argv,
      switches: [bill_amount: :float, tip_percentage: :integer],
      aliases: [ba: :bill_amount, tp: :tip_percentage] # makes '-q' an alias of '--question'
      )


    tip_float   = parse_number(tip_percentage) / 100
    bill_amount = parse_number(bill_amount)
    tip_amount  = calc_tip(tip_float, bill_amount)
    bill_total  = calc_total(tip_amount, bill_amount)

    message = "So your bill is: $#{bill_amount} \nAnd you're tipping out at #{tip_percentage}% \nwhich is: $#{tip_amount} \nfor a total of: $#{bill_total}"

    print_to_CLI(message)
    make_txt_file(message)
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
  @spec calc_tip(float, float) :: float
  def calc_tip(tip_percentage, bill_amount) do
    tip_percentage * bill_amount
    |> Float.round(2)
  end

  @doc """
  Calculates the total bill amount. Takes floats.

      iex> TipCalc.calc_total(2.0, 4.32)
      6.32
  """
  @spec calc_tip(float, float) :: float
  def calc_total(tip_amount, bill_amount) do
    tip_amount + bill_amount
    |> Float.round(2)
  end

  @doc """
  Prints 4 values to the command line: the bill amount, tip percentage, tip amount, and total bill amount.
  """
  def print_to_CLI(message)  do
    IO.puts message
  end

  def make_txt_file(message) do
    path = "./calculations"
    case File.dir?(path) do
      false ->
        File.mkdir(path)
        make_txt_file(message)
      _ ->
        File.write("#{path}/tip-calc-#{get_current_date_time}.txt", message)
    end
  end

  defp get_current_date_time do
    DateTime.utc_now
    |> DateTime.to_string
  end
end
