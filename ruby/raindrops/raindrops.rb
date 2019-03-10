module Raindrops
  PAIRS = [[3, "Pling"], [5, "Plang"], [7, "Plong"]]
  def self.convert(n)
    answer = PAIRS.map do |divisor, word|
       n % divisor == 0 ? word : ""
    end.join
    answer.empty? ? n.to_s : answer
  end
end
