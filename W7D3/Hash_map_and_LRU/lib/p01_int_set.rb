class MaxIntSet
  attr_accessor :store 
  
  def initialize(max)
    @max = max
    @store = Array.new(max, false)   
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true 
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num] == true 
  end

  private

  def is_valid?(num)
    return true if num > 0 && num < @max 
    false 
  end

  def validate!(num)
    self.is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num 
  end

  def remove(num)
    i = num % num_buckets
    @store.delete_at(i)
  end

  def include?(num)
    @store.each do |sub|
      return true if sub.include?(num)
    end
    false 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      idx = num % num_buckets
      @store[idx] << num
      @count += 1
    end
    resize! if @count == num_buckets 
  end

  def remove(num)
    if include?(num)
      i = num % num_buckets
      @store.delete_at(i)
      @count -= 1
    end 
  end

  def include?(num)
    @store.each do |sub|
      return true if sub.include?(num)
    end 
    false 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.flatten.each { |elm| self.insert(elm) }
  end
end
