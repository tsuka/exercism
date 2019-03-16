class Scrabble
  SCORE_TABLE = [
    [ %w(A E I O U L N R S T), 1],
    [ %w(D G),                 2],
    [ %w(B C M P),             3],
    [ %w(F H V W Y),           4],
    [ %w(K),                   5],
    [ %w(J X),                 8],
    [ %w(Q Z),                10],
  ].each_with_object({}) do |(letters, score), h|
      letters.each do |letter|
        h[letter] =  score
      end
    end
  SCORE_TABLE.default = 0

  def self.score(word)
    self.new(word).score
  end

  def initialize(word)
    @word = word || ""
  end

  def score
    letters.sum(&SCORE_TABLE)
  end

  def letters
    @word.upcase.chars
  end
end
