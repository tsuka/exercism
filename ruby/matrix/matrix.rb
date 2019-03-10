class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_str)
    @rows = matrix_str.each_line.map{|r| r.split.map(&:to_i)}
    @columns = @rows.transpose
  end
end
