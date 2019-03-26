defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    num_of_digits = length(digits)
    result = Enum.map(digits, fn d -> pow(d, num_of_digits) end)
    |> Enum.sum
    result == number
  end

  defp pow(a, b) do
    Enum.reduce(1..b, 1, fn _, acc -> acc * a end)
  end
end
