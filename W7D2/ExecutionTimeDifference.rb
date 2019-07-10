# smallest number in the list
# phase 1
def my_min(array)
    var = array.first
    (0..array.length - 1).each do |i| 
        (0..array.length - 1).each do |j|
            s1 = array[i]
            s2 = array[j]
            var = s1 if s1 < s2 && s1 < var 
        end 
    end 
    var
    
end
    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # p my_min(list)  # =>  -5
    

# phase 2    
def my_min(array)
    min = array.first
    array.each do |i|
        min = i if i < min
    end     
    min
end
    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # p my_min(list)  # =>  -5
    
# Largest Contiguous Sub-sum
# phase 1

def largest_contiguous_subsum(list) 
    subarray = []
    (0..list.length-1).each do |i|
        (i..list.length-1).each do |j|
            sub = list[i..j]
            subarray << sub 
        end 
    end 
    
    max_sub = subarray.first.sum 
    subarray.each {|sub| max_sub = sub.sum if sub.sum > max_sub}
    max_sub

end



# def largest_contiguous_subsum(list) 
#     max_sub = nil
#     (0..list.length-1).each do |i|
#         (i..list.length-1).each do |j|
#             sub = list[i..j]
#             max_sub = sub.sum if max_sub.nil? || sub.sum > max_sub 
#         end 
#     end 
    
#     max_sub

# end 

def largest_contiguous_subsum(list) 
    max_sum = list.first 
    current_sum = list.first
    low_end = list.first

    (1..list.length-1).each do |i|
        current_sum += list[i]
        max_sum = current_sum if max_sum < current_sum
        low_end = list[i] if list[i] > low_end
        current_sum = 0 if current_sum < 0 
    end 

    return max_sum if  max_sum > low_end
    
    low_end
end 



list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

p largest_contiguous_subsum(list1)
p largest_contiguous_subsum(list2)
p largest_contiguous_subsum(list3)






