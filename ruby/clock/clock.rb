class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hour: 0, minute: 0)
    @minute = (hour * MINUTES_PER_HOUR + minute) % MINUTES_PER_DAY
  end

  def to_s
    sprintf("%02d:%02d", *minute.divmod(MINUTES_PER_HOUR))
  end

  def +(other)
    Clock.new(minute: minute + other.minute)
  end

  def -(other)
    Clock.new(minute: minute - other.minute)
  end

  def ==(other)
    self.minute == other.minute
  end

  protected
  attr_reader :minute
end
