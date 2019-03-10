defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r([^-\p{L}\d}]+)u, trim: true)
    |> Enum.reduce(%{}, fn key, map -> Map.update(map, key, 1, &(&1 + 1)) end)
  end
end
