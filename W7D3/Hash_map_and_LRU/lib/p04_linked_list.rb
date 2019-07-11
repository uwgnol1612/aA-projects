class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head


  end

  def [](i)
    each_with_index {|node, j| return node if i == j}
    nil 
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      if node.key == key 
        return node.val 
      end 
    end 
    nil 

  end

  def include?(key)
    any? {|node| node.key == key} 

  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node 
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
 
  end

  def update(key, val)
    if include?(key)
      each do |node|
        node.val = val if node.key == key 
      end 
    end 

  end

  def remove(key)
    node = @head
    while node.next != @tail
      node = node.next 
      if node.key == key
        node.prev.next = node.next 
        node.next.prev = node.prev 
      end 
    end 
  end


  def each(&prc)
    node = @head.next
    while node != @tail
      prc.call(node)
      node = node.next
    end 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
