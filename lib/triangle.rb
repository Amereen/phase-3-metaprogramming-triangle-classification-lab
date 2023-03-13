class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    validate_triangle
  end

  def kind
    if sides.uniq.length == 1
      :equilateral
    elsif sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    if sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
      raise TriangleError.new("Invalid triangle")
    end
  end

  class TriangleError < StandardError
  end
end
