#Problem 1: 

def sum_recur(array)
    return array if array.length <= 1
    array[0] + sum_recur(array[1..-1])
end

#Problem 2: 

def includes?(array, target)
    return false if array.empty?
    return array[0] == target || includes?(array[1..-1], target)
end

# Problem 3: 

def num_occur(array, target)
    return 0 if array.empty?

    if array[0] == target 
        1 + num_occur(array[1..-1], target)
    else  
        num_occur(array[1..-1], target)
    end 
end

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length <= 1
    (array[0] + array[1]) == 12 || add_to_twelve?(array[1..-1])
end

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1 
    return false if array[0] > array[1]
    sorted?(array.drop(1)) 
end

# Problem 6: 

def reverse(string)
    return string if string.length <=1 
    reverse(string[1..-1]) + string[0]
end
