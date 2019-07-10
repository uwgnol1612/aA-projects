# phase 1
def firs_ana?(str1, str2)
    arr = str1.split("")
    per = arr.permutation(arr.length).to_a
    per.each do |sub|
        return true if sub.join == str2
    end
    false
end




# phase 2
def firs_ana?(str1, str2)
    str2 = str2.split("")
    str1.each_char do |char| 
        if str2.include?(char)
            str2.delete_at(str2.index(char))
        else  
            return false 
        end 
    end  
    str2.empty?
end 



# phase 3


def firs_ana?(str1, str2)
    str1.split("").sort == str2.split("").sort 
end




# phase 4

def firs_ana?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}
    hash1 == hash2 
    
end 


p firs_ana?("elvis", "lives")    #=> true
p firs_ana?("gizmo", "sally")    #=> false