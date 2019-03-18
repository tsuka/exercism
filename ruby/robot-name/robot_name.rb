class Robot

  attr_accessor :name

  ALPHA = ("A".."Z").to_a
  NUM = ("0".."9").to_a

  def self.forget
    @@used_names = []
  end

  def initialize
    self.reset
  end

  def reset
    new_name = loop do
      nn = (ALPHA.sample(2) + NUM.sample(3)).join
      break nn unless @@used_names.include?(nn)
    end
    self.name = new_name
    @@used_names << new_name
  end
end
