module Isogram
  def self.isogram?(input)
    alphabets = input.downcase.tr("^a-z", "");
    alphabets.size == alphabets.chars.uniq.size
  end
end
