class Prime
  attr_reader :primes
  def self.nth(n)
    raise ArgumentError.new unless n > 0
    instance = self.new
    prime = 0
    n.times do
      prime = instance.next()
    end
    prime
  end

  def initialize
    @primes = []
  end

  def next()
    prime = if primes.empty?
      2
    else
      candidate = primes.last+1
      while primes.any?{|n| (candidate % n).zero? }
        candidate += 1
      end
      candidate
    end
    primes << prime
    prime
  end
end
