class Scrabble
  SCORE_TABLE = [
    [ %w(A E I O U L N R S T), 1],
    [ %w(D G),                 2],
    [ %w(B C M P),             3],
    [ %w(F H V W Y),           4],
    [ %w(K),                   5],
    [ %w(J X),                 8],
    [ %w(Q Z),                10],
  ].reduce({}) do |h, pairs|
      letters, score = pairs
      letters.each do |letter|
        h[letter] =  score
      end
      h
    end
  SCORE_TABLE.default = 0

  def self.score(word)
    self.new(word).score
  end

  def initialize(word)
    @word = word || ""
  end

  def score
    letters.map(&SCORE_TABLE).sum
  end

  def letters
    @word.upcase.chars
  end
end
