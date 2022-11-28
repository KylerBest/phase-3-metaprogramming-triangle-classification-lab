class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  
  def kind
    validate
    if a == b && b == c
      return :equilateral
    elsif a == b || b == c || c == a
      return :isosceles
    else
      return :scalene
    end
  end

  def validate
    total = 0
    [a, b, c].each{|side| total += side}
    raise TriangleError unless [a, b, c].all?{|side| side > 0} && a + b > c && a + c > b && b + c > a
  end

  class TriangleError < StandardError

  end
end
