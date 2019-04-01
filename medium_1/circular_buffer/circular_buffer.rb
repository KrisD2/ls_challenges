class BufferEmptyException < Exception
end

class BufferFullException < Exception
end

class CircularBuffer

  def initialize(buffer_size)
    @buffer = []
    @buffer_size_limit = buffer_size
  end

  def buffer_empty_check
    raise BufferEmptyException if @buffer.empty?
  end

  def buffer_full_check
    raise BufferFullException if @buffer.size >= @buffer_size_limit
  end

  def buffer_full?
    @buffer.size == @buffer_size_limit
  end

  def read
    buffer_empty_check
    @buffer.shift
  end

  def write(element)
    return if element.nil?
    buffer_full_check
    @buffer << element
  end

  def write!(element)
    return if element.nil?
    read if buffer_full?
    write(element)
  end

  def clear
    @buffer = []
  end
end
