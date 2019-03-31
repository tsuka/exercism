class Sieve
  attr_reader :max

  def initialize(max)
    @max = max
  end

  def primes
    array = (2..max).to_a
    len = array.length
    (0..Math.sqrt(len)).each do |i|
      next if array[i].nil?
      (i+1...len).each do |j|
        array[j] = nil if array[j] && (array[j] % array[i]).zero?
      end
    end
    array.compact
  end
end
