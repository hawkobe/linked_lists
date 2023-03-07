require_relative 'node.rb'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value, node = @head)
    # return add_first(value) if @head == nil
    # node = @head
    # until node.next_node == nil
    #   node = node.next_node
    # end
    # node.next_node = create_node(value)
    return (node.next_node = create_node(value)) if node.next_node == nil

    append(value, node.next_node)
  end

  def prepend(value)
    @head = create_node(value, @head)
  end

  def find(value, node = @head, counter = 0)
    # node = @head
    # until node.value == value
    #   node = node.next_node
    # end
    # p node

    # think can recursive this if include (next_node) in param
    # p node.value
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
  #   counter = 1
  #   node = @head
  #   until node.next_node == nil
  #     node = node.next_node
  #     counter += 1
  #   end
  #   counter
  # end
  return counter if node.next_node == nil
  size(node.next_node, counter += 1)
  end

  def at(index)
    node = @head
    counter = 0
    until counter == index
      node = node.next_node
      counter += 1
    end
    node
  end

  def clear
    @head = nil
  end

  # def head
  #   # node at(index) (0)
  # end
end

list = LinkedList.new

list.add_first(1)

5.times do
  list.append(rand(10))
end

p list

p list.at(3)

