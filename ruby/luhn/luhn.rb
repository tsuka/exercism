module Luhn
  def self.valid?(digits)
    digits = digits.delete(' ').reverse
    return false if invalid_length?(digits) || contains_invalid_char?(digits)
    (checksum(digits) % 10).zero?
  end

  def self.invalid_length?(digits)
    digits.length <= 1
  end

  def self.contains_invalid_char?(digits)
    digits !~ /\A\d+\Z/
  end

  def self.checksum(digits)
    digits.chars.map(&:to_i).each_slice(2).map{|a,b=0| a + double_bounded(b)}.sum
  end

  def self.double_bounded(num)
    double = num * 2
    double > 9 ? double - 9 : double
  end
end
