class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(slice_length)
    raise ArgumentError.new("slice_length is too long") if digits.length < slice_length
    digits.chars.each_cons(slice_length).map(&:join)
  end
end
