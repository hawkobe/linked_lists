require_relative 'node.rb'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value, node = @head)
    return (node.next_node = create_node(value)) if node.next_node == nil

    append(value, node.next_node)
  end

  def prepend(value)
    @head = create_node(value, @head)
  end

  def find(value, node = @head, counter = 0)
    return counter if node.value == value
    return nil if node.next_node == nil

    find(value, node.next_node, counter += 1)
  end

  def add_first(value)
    @head = Node.new(value)
  end

  def create_node(value, next_node = nil)
    Node.new(value, next_node)
  end

  def size(node = @head, counter = 1)
  return counter if node.next_node == nil

  size(node.next_node, counter += 1)
  end

  def at(index, node = @head, counter = 0)
    return node if counter == index
    return puts "Index is out of bounds!" if node == nil
    at(index, node.next_node, counter += 1)
  end

  def tail
    node = @head
    until node.next_node == nil
      node = node.next_node
    end
    node
  end

  def pop
    self.at(self.size - 2).next_node = nil
  end

  def clear
    @head = nil
  end

  def contains?(value)
    node = @head
    until node.next_node == nil
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def to_s
    node = @head
    until node.next_node == nil
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    puts "nil"
  end

  def insert_at(value, index)
    if index == 0
      return @head = create_node(value, @head)
    elsif self.at(index) == nil
      return nil
    else
      return self.at(index - 1).next_node = create_node(value, self.at(index))
    end
  end

  def remove_at(index)
    if index == 0
      @head = self.at(index + 1)
    elsif self.at(index) == nil
      return nil
    else
      self.at(index - 1).next_node = self.at(index + 1)
    end
  end
end

list = LinkedList.new

list.add_first(rand(100))

5.times do
  list.append(rand(10))
end

list.to_s

list.remove_at(5)

list.to_s







