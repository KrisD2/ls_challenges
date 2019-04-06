# scan and extract all individual problems
#create alias for add/subtract/mult/divide
#reduce array by sending each element

class WordProblem

  OPERATIONS = { "plus" => "+", "minus" => "-",
                 "multiplied by" => "*", "divided by" => "/" }

  def initialize(word_problem)
    @word_problem = word_problem
    @word_problem_calculations = word_problem.
    scan(/((-?\d+\s)?(minus|divided by|multiplied by|plus)\s-?\d+)/).
    map { |arr| arr[0].gsub(/(minus|divided by|multiplied by|plus)/, OPERATIONS)}
  end

  def answer
    raise ArgumentError if @word_problem_calculations.empty?
    @word_problem_calculations[1..-1].reduce(eval(@word_problem_calculations[0])) do |total, calculation|
      total = eval("#{total} #{calculation}")
    end
  end
end
