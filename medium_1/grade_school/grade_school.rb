class School

  def initialize
    @roster = {}
  end

  def to_h
    @roster.merge(@roster) { |_, students| students.sort}.to_h.sort.to_h
  end

  def add(student_name, grade)
    @roster.key?(grade) ? @roster[grade] << student_name : @roster[grade] = [student_name]
  end

  def grade(grade)
    @roster.fetch(grade, [])
  end
end
