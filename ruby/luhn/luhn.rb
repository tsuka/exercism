module Luhn
  def self.valid?(digits)
    digits = digits.tr(' ', '').reverse
    return false if digits.length <= 1 || digits !~ /\A\d+\Z/

    digits.chars.map(&:to_i).each_slice(2).map{|a,b=0| a + adjust(b)}.sum % 10 == 0
  end

  def self.adjust(num)
    double = num * 2
    double > 9 ? double - 9 : double
  end
end
