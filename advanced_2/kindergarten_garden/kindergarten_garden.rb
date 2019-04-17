class Garden
  attr_reader :plants, :students

  PLANTS = { "V" => :violets, "R" => :radishes, "C" => :clover, "G" => :grass }

  DEFAULT_STUDENTS = ["Alice", "Bob", "Charlie", "David", "Eve",
                      "Fred", "Ginny", "Harriet", "Ileana",
                      "Joseph", "Kincaid", "Larry"]

  def initialize(plants, students=DEFAULT_STUDENTS)
    @plants = plants.split("\n")
    @students = students.sort

    @students.each_with_index do |student, index|
      define_singleton_method(:"#{student.downcase}") do
        students_plants = []
        2.times do |n|
          students_plants << @plants[n][index*2] << @plants[n][(index*2)+1]
        end
        students_plants.map { |plant| PLANTS[plant]}
      end
    end
  end
end
