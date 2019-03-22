module Grains
  SQUARES_RANGE = 1..64

  def self.square(n)
    raise ArgumentError unless SQUARES_RANGE.cover?(n)
    2 ** (n-1)
  end

  def self.total
    SQUARES_RANGE.sum{|n| square(n)}
  end
end
