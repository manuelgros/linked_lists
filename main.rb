# List class containing  the full list
class LinkedList

  attr_accessor :name
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def append(value)
    node = Node.new(value)
    if  @head.nil?
      @tail = node
      @head = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def size
    count = 0
    active_node = @head
    until active_node == nil
      count += 1
      active_node = active_node.next_node
    end
    count
  end

  def at(index)
    active_node = @head
    (index-1).times do 
      active_node = active_node.next_node
      
      return if active_node == nil
    end
    active_node
  end

  def pop
    return nil if @tail.nil?

    active_node = @head
    until active_node.next_node == @tail
      active_node = active_node.next_node
    end
    @tail = active_node
    deleted_node = active_node.next_node
    active_node.next_node = nil
    deleted_node
  end

  def contains(value)
    active_node = @head
    until active_node == nil
      return true if active_node.value == value

      active_node = active_node.next_node
    end
    false
  end

  def find(value)
    active_node = @head
    index = 1
    until active_node == nil
      return index if active_node.value == value

      active_node = active_node.next_node
      index += 1
    end
    nil
  end

  # Still ptints the List object itself at the end (not for empty list though)
  def to_s
    return '-- empty --' if @head.nil?

    active_node = @head
    until active_node == nil
      print "( #{active_node.value} ) -> "
      active_node = active_node.next_node
    end
    puts "nil"
  end
    

  def insert_at(value, index = 1)
    return self.prepend(value) if index == 1

    new_node = Node.new(value)
    active_node = @head
    (index-2).times do
      active_node.next_node = Node.new if active_node.next_node == nil

      active_node = active_node.next_node
    end
    new_node.next_node = active_node.next_node
    active_node.next_node = new_node
  end

  
  def remove_at(index)
    return nil if @head == nil

    if index == 1
      deleted_node = @head
      @head = @head.next_node
      deleted_node
    else
      active_node = @head
      (index-2).times do
        active_node = active_node.next_node
        return self.pop if active_node == @tail

      end
      deleted_node = active_node.next_node
      active_node.next_node = active_node.next_node.next_node
      deleted_node
    end
  end
end

# Node class
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new
list.append "Bert"
list.append "Carl"
list.append "Eddy"
list.prepend "Aaron"
puts list

# list.insert_at("Carolin", 8)
# puts list
list.remove_at 8
puts list
