defmodule CharCounter do
  def main(args) do
    get_string
    |> sanitize_string
    |> output_to_term
  end

  @doc """
  Gets user input from the command line and returns a trimmed string.
  """
  @spec get_string :: String.t
  def get_string do
    String.trim(IO.gets "What is the input string? ")
  end

  @doc """
  If a blank string or space is entered a message is put to the command line and it calls get_string until characters are entered.
  """
  def sanitize_string(string) do
    cond do
      String.length(string) == 0 ->
        IO.puts "You have to enter something!"
        main(string)
      true ->
        string
    end
  end

  @doc """
  Outputs the string entered, counts the length, and puts it all to the command line in a message.
  """
  @spec output_to_term(String.t) :: String.t
  def output_to_term(string) do
    IO.puts "#{string} has #{String.length(string)} characters."
  end
end
