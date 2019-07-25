require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |list|
      return true if list.include?(key)
    end 
    false 

  end

  def set(key, val)
    if include?(key)
      list = bucket(key)
      list.update(key, val)
    else
      list = bucket(key)
      list.append(key, val)
      @count += 1
      resize! if @count == num_buckets
    end 
  end

  def get(key)
    if include?(key)
      return bucket(key).get(key)
    end 
    nil  

  end

  def delete(key)
    if include?(key)
      list = bucket(key)
      list.remove(key)
      @count -= 1
    end 
  end

  def each(&prc) 
    @store.each do |list|
      list.each do |node|
        prc.call(node.key, node.val)
      end 
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store 
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0 
    old_store.each do |list|
      list.each do |node|
        self.set(node.key, node.val)
      end 
    end 
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
