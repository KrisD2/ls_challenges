class Matrix
  attr_reader :rows

  def initialize(string_matrix)
    @rows = string_matrix.split("\n").map(&:split).
              map{|row| row.map(&:to_i)}
  end

  def columns
    rows.transpose
  end

  def saddle_points
    saddles = []
    @rows.each_with_index do |row, row_num|
      row.each_with_index do |point, col_num|
        if point == row.max && point == columns[col_num].min
          saddles << [row_num, col_num]
        end
      end
    end
    saddles
  end

end
