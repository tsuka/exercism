module Isogram
  def self.isogram?(input)
    alphabets = input.downcase.scan(/[a-z]/);
    alphabets.size == alphabets.uniq.size
  end
end
