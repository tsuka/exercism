class Sieve
  attr_reader :max
  attr_accessor :array

  def initialize(max)
    @max = max
  end

  def primes
    self.array = (2..max).to_a
    len = array.length
    (0..Math.sqrt(len)).each do |i|
      next if sieved?(i)
      (i+1...len).each do |j|
        self.array[j] = nil if to_sieve?(i,j)
      end
    end
    array.compact
  end

  def sieved?(i)
    array[i].nil?
  end

  def to_sieve?(i,j)
    array[j] && (array[j] % array[i]).zero?
  end
end
