class Bst
  attr_accessor :node, :left, :right

  def initialize(node)
    @node = node
    @left = nil
    @right = nil
  end

  def data
    @node
  end

  def insert(num)
    current_node = self
    loop do
      if num <= current_node.node
        if current_node.left == nil
          current_node.left = Bst.new(num)
          break
        end
        current_node = current_node.left
      end
      if num > current_node.node
        if current_node.right == nil
          current_node.right = Bst.new(num)
          break
        end
        current_node = current_node.right
      end
    end
  end

  def each(node=self, &block)
    return to_enum(:each) unless block_given?
    if node.left
      each(node.left, &block)
      yield(node.left.data) unless node.left.left
    end
    yield(node.data) if node.data == self.data
    yield(node.data) unless node.data == self.data ||
                            (!(node.left) && !(node.right))
    if node.right
      each(node.right, &block)
      yield(node.right.data) unless node.right.right
    end
  end

end


four = Bst.new 4
four.insert 2
four.insert 6
four.insert 1
four.insert 3
four.insert 7
four.insert 5


=begin
four = Bst.new 8
four.insert 5
four.insert 12
four.insert 2
four.insert 6
four.insert 1
four.insert 3
four.insert 4
four.insert 7
four.insert 10
four.insert 14
four.insert 9
four.insert 11
four.insert 13
four.insert 15
=end

# p four.data
# p four.left.data
# p four.left.left.data
# p four.left.right.data
# p four.right.data
# p four.right.left.data
# p four.right.right.data

# four.each

=begin
all_data = []
four.each { |data| all_data << data }
p all_data
=end
