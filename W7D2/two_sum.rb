def bad_two_sum(array, target_sum)
    pair = []
    (0..array.length - 1).each do |i|
        (i + 1..array.length - 1).each do |j|
            pair << [i,j]
        end
    end
    pair.each do |p|
        return true if array[p[0]] + array[p[1]] == target_sum 
    end
    false
end




def okay_two_sum(array, target_sum)
    array.sort!

    i = 0 
    j = array.length - 1
    while i < j 
        a1 = array[i]
        a2 = array[j]
       if a1 + a2 == target_sum
        return true 
       elsif a1 + a2 > target_sum
        j -= 1
       else  
        i += 1
       end 
    end 
    false     
end 



# {6:0,5:1,1:?5,-1:7}
require "byebug"
# arr = [0, 1, 5, 7] 6
def two_sum(array, target_sum)
    hash = {}
    array.each do |ele|
        hash[target_sum - ele] = ele
    end 
    array.each do |ele|
        # debugger
        return true if !(hash[ele].nil? || hash[ele] == ele) 
    end 
    false 
end   
    
arr = [0, 1, 5, 7]
p two_sum(arr, 6) # => should be true
p two_sum(arr, 10) # => should be false