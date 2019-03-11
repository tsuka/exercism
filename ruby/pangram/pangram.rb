require 'set'
module Pangram
  def self.pangram?(sentence)
    Set.new(sentence.downcase.split("")).superset?(Set.new('a'..'z'))
  end
end
