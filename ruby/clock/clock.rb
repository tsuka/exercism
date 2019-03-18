class Clock
  ONE_DAY = 60*24
  attr_accessor :minute

  def initialize(hour: hour = 0, minute: minute = 0)
    self.minute = (hour * 60 + minute) % ONE_DAY
  end

  def to_s
    sprintf("%02d:%02d", minute / 60, minute % 60)
  end

  def +(other)
    Clock.new(minute: (self.minute + other.minute))
  end

  def -(other)
    Clock.new(minute: (self.minute - other.minute))
  end

  def ==(other)
    self.minute == other.minute
  end
end
