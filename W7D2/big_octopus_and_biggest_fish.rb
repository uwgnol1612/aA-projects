fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths.

def sluggish_octopus(fish)
    sorted = false 
    until sorted
        sorted = true 
        (0..fish.length-2).each do |idx|
            if fish[idx].length > fish[idx+1].length 
                fish[idx], fish[idx+1] = fish[idx+1], fish[idx]
                sorted = false 
            end 
        end 
    end 
    fish.last
end 

# p sluggish_octopus(fish_array)

# Dominant Octopus

# Find the longest fish in O(n log n) time. 
# Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo.


def dominant_octopus(fish)
    return fish if fish.length < 2

    mid = fish.length / 2
    left = fish.take(mid)
    right = fish.drop(mid)
    sorted_left = dominant_octopus(left)
    sorted_right = dominant_octopus(right)
    merge(sorted_left, sorted_right)
end 

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            merged << left.shift
        else  
            merged << right.shift 
        end 
    end 
    merged + left + right    
end 

# p dominant_octopus(fish_array).last

# Clever Octopus
# Find the longest fish in O(n) time. 
# The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_ocopus(fish)
    longest_fish = nil 
    (0..fish.length-1).each do |idx|
        if longest_fish.nil? || fish[idx].length > longest_fish.length 
            longest_fish = fish[idx]
        end 
    end 
    longest_fish
end 

# p clever_ocopus(fish_array)

#Dancing Octopus

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]



# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. 
# This should take O(n) time.

def slow_dance(move, tiles)
    tiles.each_with_index do |tile, index|
        if tile == move 
            return index 
        end 
    end 
    nil 
end 

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles = {
    "up" => 0, 
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(move, tiles)
    tiles[move]
end 

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)




