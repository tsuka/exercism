defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{bottle(number, true)} of beer on the wall, #{bottle(number)} of beer.
    """ <>
      case number do
        0 ->
          """
          Go to the store and buy some more, #{bottle(99)} of beer on the wall.
          """

        _ ->
          """
          Take #{taken(number)} down and pass it around, #{bottle(number - 1)} of beer on the wall.
          """
      end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range |> Enum.map(&verse(&1)) |> Enum.join("\n")
  end

  defp bottle(number, capitalize \\ false) do
    case {number, capitalize} do
      {0, true} -> "No more bottles"
      {0, false} -> "no more bottles"
      {1, _} -> "1 bottle"
      _ -> "#{number} bottles"
    end
  end

  defp taken(n) do
    case n do
      1 -> "it"
      _ -> "one"
    end
  end
end
