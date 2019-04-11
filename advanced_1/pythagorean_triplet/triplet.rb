class Triplet

  def initialize(*args)
    @args = args.sort
  end

  def sum
    @args.inject(:+)
  end

  def product
    @args.inject(:*)
  end

  def pythagorean?
    Math.sqrt(@args[0]**2 + @args[1]**2) == @args[2]
  end

  def self.pythagorean?(*args)
    Math.sqrt(args[0]**2 + args[1]**2) == args[2]
  end

  def self.where(min_factor: 1, max_factor:, sum: nil)
    triplets = []
    min_factor.upto(max_factor) do |num1|
      num1.upto(max_factor) do |num2|
        num2.upto(max_factor) do |num3|
          if Triplet.pythagorean?(num1, num2, num3)
            triplets << [num1, num2, num3]
          end
        end
      end
    end
    triplets.select!{ |n| n.inject(:+) == sum} if sum
    triplets
  end
end

class Array
  def product
    self.inject(:*)
  end
end
