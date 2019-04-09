class SimpleLinkedList

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(el)
    @list.unshift Element.new(el)
    @list[0].next = @list[1] if @list.size > 1
  end

  def peek
    @list.first ? @list.first.datum : @list.first
  end

  def head
    @list.first
  end

  def pop
    @list.shift.datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each do |el|
      list.push(el)
    end
    list
  end

  def to_a
    @list.map { |el| el.datum }
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

end


class Element
  attr_accessor :next

  def initialize(el, nxt=nil)
    @el = el
    @next = nxt
  end

  def datum
    @el
  end

  def tail?
    @next == nil
  end
end
