defmodule CharCounter do
  def main(argv) do
    input =
      get_string

    input
    |> output_to_term
  end

  def get_string do
    input = IO.gets "What is the input string?"
    input = String.trim(input)

    cond do
      String.length(input) == 0 ->
        IO.puts "You have to enter something!"
        get_string
      true ->
        input
        |> String.trim
    end
  end

  defp output_to_term(input) do
    IO.puts "#{input} has #{String.length(input)} characters."
  end
end
