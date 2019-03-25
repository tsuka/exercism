defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    num_of_digits = length(digits)
    result = Enum.map(digits, fn d -> ceil(:math.pow(d, num_of_digits)) end)
    |> Enum.sum
    result == number
  end
end
