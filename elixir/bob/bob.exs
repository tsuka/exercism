defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      all_upcase?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      all_upcase?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp all_upcase?(str) do
    String.upcase(str) == str && String.upcase(str) != String.downcase(str)
  end

  defp question?(str) do
    String.ends_with?(str, "?")
  end
end
