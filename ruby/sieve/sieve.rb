class Sieve
  attr_reader :max

  def initialize(max)
    @max = max
  end

  def primes
    array = (2..max).to_a
    pos = 0
    loop do
      break if array.length <= pos || array[pos] >= max / 2
      divisor = array[pos]
      array.delete_if {|n| n != divisor && (n % divisor).zero?}
      pos += 1
    end
    array
  end
end
