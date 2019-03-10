class Triangle
  def initialize(edges)
    @edges = edges
  end

  def uniq_count
    @edges.uniq.count
  end

  def equilateral?
    uniq_count == 1 && valid?
  end

  def isosceles?
    uniq_count <= 2 && valid?
  end

  def scalene?
    uniq_count == 3 && valid?
  end

  def valid?
    a,b,c = @edges.sort
    a > 0 && c <= a + b
  end
end
