class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    var = 0
    self.each_with_index do |el, idx|
      var += el.hash * idx.hash
    end 
    var  
  end
end

class String
 def hash
    alpha = ("a".."z").to_a
    alpha_idx = []
    var = 0

    self.each_char.with_index do |elm, i|
      idx = alpha.index(elm)
      alpha_idx << idx 
    end 
      
    alpha_idx.hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.sort_by {|k,v| k}
    arr.flatten.hash
  end
end
