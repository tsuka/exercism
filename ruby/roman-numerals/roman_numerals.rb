class Integer
  ROMAN_TABLE = [
    {1 => "I", 5 => "V", 10 => "X"},
    {1 => "X", 5 => "L", 10 => "C"},
    {1 => "C", 5 => "D", 10 => "M"},
    {1 => "M"}
  ]

  def to_roman
    roman, n = ROMAN_TABLE.reduce(["", self]) do |(roman, n), table|
      digit = n % 10
      str = case digit
      when 9
        table[1] + table[10]
      when 5..8
        table[5] + (table[1] * (digit - 5))
      when 4
        table[1] + table[5]
      else
        table[1] * digit
      end
      [str + roman, n / 10]
    end
    roman
  end
end
