class Hamming
  def self.compute(strands1, strands2)
    raise ArgumentError if strands1.length != strands2.length
    pairs = strands1.chars.zip(strands2.chars)
    pairs.count {|a,b| a != b}
  end
end
