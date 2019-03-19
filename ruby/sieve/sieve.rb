class Sieve
  attr_reader :max

  def initialize(max)
    @max = max
  end

  def primes
    array = (2..max).to_a
    pos = 0
    loop do
      break if array.length <= pos || array[pos] >= Math.sqrt(max)
      divisor = array[pos]
      array.delete_if {|n| n != divisor && divisible?(n, divisor)}
      pos += 1
    end
    array
  end

  def divisible?(dividend, divisor)
    dividend -= divisor while dividend > 0
    dividend.zero?
  end
end
