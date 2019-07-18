require "byebug"
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(num1, num2)
    return [] if num2 <= num1
    range(num1, num2-1) + [num2 - 1] 
end  

# Write both a recursive and iterative version of sum of an array.

def sum(array)
  return 0 if array.empty?
  array.first + sum(array[1..-1])
end

#Exponentiation
# Write two versions of exponent that use two different recursions:

def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp2(b, n/2) ** 2
  else  
    b * (exp2(b, (n - 1) / 2) ** 2)
  end
end

# Deep dup
# The #dup method doesn't make a deep copy:

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def deep_dup(array)
    arr = []
    return [] if array.empty?
    return array if array.length == 1 
    array.each do |ele|
        if ele.is_a? Array 
            arr << deep_dup(ele)
        else  
            arr << ele
        end 
    end 
    arr  
end 

#fib arr
def fib(n)
  return [0,1] if n == 2
  prev = fib(n - 1)
  sum = prev[-1] + prev[-2]
  prev << sum
end



def bs(arr, target)
  return nil if arr.empty?
  return nil if arr.length <= 1 && arr[0] != target

  mid_idx = arr.size / 2
  if arr[mid_idx] == target
    return mid_idx
  elsif arr[mid_idx] > target
    bs(arr[0...mid_idx], target)
  else 
    check = bs(arr[mid_idx..-1], target)
    return nil if check.nil?
    mid_idx + check
  end
  
end

# p bs([1, 2, 3], 1) # => 0
# p bs([2, 3, 4, 5], 3) # => 1
# p bs([2, 4, 6, 8, 10], 6) # => 2
# p bs([1, 3, 4, 5, 9], 5) # => 3
# p bs([1, 2, 3, 4, 5, 6], 6) # => 5
# p bs([1, 2, 3, 4, 5, 6], 0) # => nil
# p bs([1, 2, 3, 4, 5, 7], 6) # => nil 3 + 1 + bs([5,7])


def merge_sort(array)
    return array if array.length <= 1
    mid = array.size / 2
    left = array[0...mid]
    right = array[mid..-1]
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)
    return merge(sorted_left, sorted_right)
end 

def merge(left, right)
  arr = []
  while !left.empty? && !right.empty?
    if left.first <= right.first
      arr.push(left.first)
      left.shift
    else  
      arr.push(right.first)
      right.shift
    end
  end 
  
  while !left.empty?
    arr.push(left.first)
    left.shift
  end 

  while !right.empty?
    arr.push(right.first)
    right.shift
  end
  arr
end

# p merge_sort([2,6,1,9,4,7,2,0,5])

def subsets(arr)
  return [[]] if arr.empty?
  new_arr = []
  subsets(arr[0..-2]).each do |sub|
    sub << arr.last
    new_arr << sub
  end
  subsets(arr[0..-2]) + new_arr
end


subsets([]) # => [[]]
subsets([1]) # => [[], [1]]
subsets([1, 2]) # => [[], [1], [2], [1, 2]]
subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



def permutations(array)
  return [array] if array.length < 2

  result = []
  prev = permutations(array[0..-2])
  prev.each do |perm|
    (0..perm.size).each do |idx|
      result << perm.dup.insert(idx, array.last)
    end
  end 
  
  result
end  



def make_better_change(amount, coins)

  return [] if amount == 0 

  best_change = nil

  coins.each do |coin|
    next if coin > amount 
    change_for_rest = make_better_change(amount - coin, coins)
    change = [coin] + change_for_rest

    if best_change.nil? || change.count < best_change.count 
      best_change = change
    end  
  end 

  best_change 

end

p make_better_change(24, [10,7,1])