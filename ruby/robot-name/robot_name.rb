class Robot

  attr_accessor :name

  def self.forget
    @@pointer = 0
    @@stocked_name = ("AA000".."ZZ999").to_a.shuffle
  end

  def initialize
    self.reset
  end

  def next_name
    self.name = @@stocked_name[@@pointer]
  end

  def reset
     raise "Limit exceeded." unless next_name
     @@pointer += 1
  end
end
