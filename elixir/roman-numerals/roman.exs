defmodule Roman do
  import String, only: [duplicate: 2, replace: 3]

  @roman_letters ["I", "X", "C", "M"]
  @replace_patterns [
    {duplicate("I", 9), "IX"},
    {duplicate("I", 5), "V"},
    {duplicate("I", 4), "IV"},
    {duplicate("X", 9), "XC"},
    {duplicate("X", 5), "L"},
    {duplicate("X", 4), "XL"},
    {duplicate("C", 9), "CM"},
    {duplicate("C", 5), "D"},
    {duplicate("C", 4), "CD"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number
    |> simple_convert
    |> shorten
  end

  defp simple_convert(number) do
    {str, _} =
      @roman_letters
      |> Enum.reduce({"", number}, fn roman, {s, n} ->
        {duplicate(roman, rem(n, 10)) <> s, div(n, 10)}
      end)

    str
  end

  defp shorten(str) do
    @replace_patterns
    |> Enum.reduce(str, fn {pattern, replacement}, s -> replace(s, pattern, replacement) end)
  end
end
