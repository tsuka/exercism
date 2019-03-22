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
    @@stocked_name[@@pointer]
  end

  def reset
    self.name = next_name
    raise "Limit exceeded." unless self.name
    @@pointer += 1
  end
end
