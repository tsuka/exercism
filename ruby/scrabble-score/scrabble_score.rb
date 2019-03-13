class Scrabble
  SCORE_TABLE = Hash[*[
    [ %w(A E I O U L N R S T), 1],
    [ %w(D G),                 2],
    [ %w(B C M P),             3],
    [ %w(F H V W Y),           4],
    [ %w(K),                   5],
    [ %w(J X),                 8],
    [ %w(Q Z),                10],
  ].flat_map { |letters, score|
    letters.map {|letter| [letter, score]}
  }.flatten]
  SCORE_TABLE.default = 0

  def self.score(word)
    self.new(word).score
  end

  def initialize(word)
    @word = word&.upcase
  end

  def score
    @word && @word.chars.map{|c| SCORE_TABLE[c]}.reduce(:+) || 0
  end
end
