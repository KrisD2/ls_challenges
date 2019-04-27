class Bst
  attr_accessor :node, :left, :right

  def initialize(node)
    @node = node
  end

  def data
    @node
  end

  def insert(num)
    if num <= data
      if @left
        @left.insert(num)
      else
        @left = Bst.new(num)
      end
    end
    if num > data
      if @right
        @right.insert(num)
      else
        @right = Bst.new(num)
      end
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    @left.each(&block) if @left
    yield(data)
    @right.each(&block) if @right
  end
end
