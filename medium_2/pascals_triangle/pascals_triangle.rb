class Triangle

  def initialize(size)
    @size = size
    @triangle = [[1]]
  end

  def rows
    row = 0
    until @triangle.size == @size
      row += 1
      current_row = []
      current_row << 1
      until current_row.size == @triangle[row-1].size
        @triangle[row-1].each_cons(2) do |num1, num2|
          current_row << num1 + num2
        end
      end
      current_row << 1
      @triangle << current_row
    end
    @triangle
  end
end
