module Raindrops
  PAIRS = [[3, "Pling"], [5, "Plang"], [7, "Plong"]]
  def self.convert(n)
    answer = ""
    PAIRS.each do |divisor, word|
      answer += word if n % divisor == 0
    end
    answer.empty? ? n.to_s : answer
  end
end
