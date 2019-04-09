class Sieve
  attr_reader :max
  attr_accessor :sieve

  def initialize(max)
    @max = max
  end

  def primes
    self.sieve = (2..max).to_a
    len = sieve.length
    (0..Math.sqrt(len)).each do |i|
      next if sieved?(i)
      (i+1...len).each do |j|
        add_to_sieve(j) if dividable?(i,j)
      end
    end
    sieve.compact
  end

  def sieved?(i)
    sieve[i].nil?
  end

  def dividable?(i,j)
    sieve[j] && (sieve[j] % sieve[i]).zero?
  end

  def add_to_sieve(i)
    self.sieve[i] = nil
  end
end
