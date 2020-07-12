class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    if @head
      old_head = @head
      @head = Node.new(value, old_head)
    else
      @head = Node.new(value)
    end
  end

  def pop
    node = @head
    tail_index = self.size - 1
    unless tail_index > 0
      @head = nil 
    else
      (tail_index - 1).times do
        node = node.next_node
      end
      node.next_node = nil
    end
  end

  def insert_at(value, index)
    node = @head
    return unless node
    if index < 1
      self.prepend(value)
    elsif index > self.size
      self.append(value)
    else
      (index - 1).times do
        node = node.next_node
      end
      previous_node = node
      next_node = node.next_node
      previous_node.next_node = Node.new(value, next_node)
    end
  end

  def remove_at(index)
    node = @head
    return unless node
    if index < 1
      @head = node.next_node
    elsif index > self.size
      self.pop
    else
      (index - 1).times do
        node = node.next_node
      end
      node.next_node = node.next_node.next_node
    end
  end

  def tail
    node = @head
    return unless node
    return node unless node.next_node
    while node.next_node do
      node = node.next_node
    end
    node
  end

  def size
    node = @head
    count = 1
    return 0 unless node
    while node.next_node do
      count += 1
      node = node.next_node
    end
    count
  end

  def at(index)
    node = @head
    return unless node
    return if index > self.size
    index.times do
      node = node.next_node
    end
    node
  end

  def contains?(value)
    node = @head
    return false unless node
    return true if node.value == value
    while node.next_node do
      node = node.next_node
      return true if node.value == value
    end
    false
  end

  def find(value)
    node = @head
    index = 0
    return unless node
    return index if node.value == value
    while node.next_node do
      node = node.next_node
      index += 1
      return index if node.value == value
    end
  end

  def to_s
    node = @head
    return "" unless node
    string = "( #{node.value} ) "
    while node.next_node do
      node = node.next_node
      string += "-> ( #{node.value} ) "
    end
    string += "-> nil"
  end

end

class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end