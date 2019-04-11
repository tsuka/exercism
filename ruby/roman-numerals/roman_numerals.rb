class Integer
  ROMAN_TABLE = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I",
  }

  def to_roman
    roman, remain = ROMAN_TABLE.reduce(["", self]) do |(roman, remain), (n, roman_digit)|
      while remain >= n
        remain -= n
        roman += roman_digit
      end
      [roman, remain]
    end
    roman
  end
end
