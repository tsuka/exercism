class Robot

  attr_accessor :name

  ALPHA = ("A".."Z").to_a
  NUM = ("0".."9").to_a

  def self.forget
    @@pointer = 0
    @@stocked_name = ALPHA.repeated_permutation(2).to_a.product(
        NUM.repeated_permutation(3).to_a
    ).map(&:join).shuffle
  end

  def initialize
    self.reset
  end

  def reset
    self.name = @@stocked_name[@@pointer] or raise "Limit exceeded."
    @@pointer += 1
  end
end
