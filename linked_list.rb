class Node

  attr_accessor :value, :next_node

  def initialize(value=nil)
    @value = value
    @next_node = nil
  end

end

class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    to_append = Node.new(value)
    if self.head == nil
      self.head = to_append
    elsif self.tail == nil
      self.head.next_node = to_append
      self.tail = to_append
    else
      self.tail.next_node = to_append
      self.tail = to_append
    end
  end

  def prepend(value)
    to_prepend = Node.new(value)
    temp = self.head
    self.head = to_prepend
    self.head.next_node = temp
  end

  def size
    res = 0
    pointer = self.head
    while pointer != nil
      pointer = pointer.next_node
      res += 1
    end
    res
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    pointer = self.head
    for i in 1...index
      pointer = pointer.next_node
    end
    pointer
  end

  def pop
    pointer = self.head
    while pointer.next_node != tail
      pointer = pointer.next_node
    end
    pointer.next_node = nil
    self.tail = pointer
  end

  def contains?(value)
    pointer = self.head
    while pointer != nil
      if pointer.value == value
        return true
      end
      pointer = pointer.next_node
    end
    return false
  end

  def find(value)
    res = 0
    pointer = self.head
    while pointer != nil
      if pointer.value == value
        return res
      end
      res += 1
      pointer = pointer.next_node
    end
    return nil
  end

  def to_s
    s = ""
    pointer = self.head
    while pointer != nil
      s = s + "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    s = s + "nil"
    s
  end

  def insert_at(value, index) 
    if index == 0
      temp = self.head
      to_insert = Node.new(value)
      to_insert.next_node = temp
      self.head = to_insert
    else
      pointer = self.head
      for i in 1...index
        pointer = pointer.next_node
      end
      temp = pointer.next_node
      to_insert = Node.new(value)
      to_insert.next_node = temp
      pointer.next_node = to_insert
    end
  end

  def remove_at(index)
    if index == 0
      temp = self.head.next_node
      self.head = temp
    else
      pointer = self.head
      for i in 1...index
        pointer = pointer.next_node
      end
      temp = pointer.next_node
      pointer.next_node = temp.next_node
    end
  end

end