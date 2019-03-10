class Phrase
  WORD_PATTERN = /\b[\w']+\b/
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words(@phrase).reduce(Hash.new(0)) {|hash, word| hash[word] += 1; hash}
  end

  def words(phrase)
    phrase.downcase.scan(WORD_PATTERN)
  end

end
