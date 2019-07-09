
class WhatIsSelf
  def test
    puts "At the instance level, self is #{self}"
  end

  def self.test
    puts "At the class level, self is #{self}"
  end
end

WhatIsSelf.test
 #=> At the class level, self is WhatIsSelf

WhatIsSelf.new.test
 #=> At the instance level, self is #<WhatIsSelf:0x28190>

------------------------------------------------------------

class JukeBox
    def initialize(player, track)
        @playlist = Playlist.new
    end 

    def play 
    end

    def check_song(song_name)
    end 

end 

class Player 
    def initialize(name)
    end 

    def prompt
    end 

    def get_song
    end 

    def check_song_valid
    end 
end 


class Playlist
    def initialize
        playlist = []
    end 

    def add_song(song_name)
    end 

    def delete_song(song_name)
    end

end 

class Track 
    def initialize
    end 
end 

-------------------------ANSWER------------------
class Jukebox
  attr_accessor :user
  attr_reader :current_track

  def initialize(player, user)
    @player = player
    @user = user
    @current_track = nil
  end
end

class Player
  attr_accessor :album, :playlist

  def initialize(album, playlist)
    @album = album
    @playlist = playlist
  end

  def play_track(track)
    # Begin playing...
  end
end

class Playlist
  def initialize
    @queue = []
  end

  def add_track(track)
    @queue.push(track)
  end

  def shift
    @queue.shift
  end
end

class Album
  # Information about the album
end

class Track
  # Information about the track, including album
end

class User
  # Information about the user.
end



-------------------------------------------------

class ParkingLot

    def initialize(num_spaces)
        @num_spaces = space
    end

    def check_space(spot_num)
    end

    def empty_spaces

    end

    def park_vehicle(vehicle)
    end

    def empty_lot(all_spaces)
        empty?
        
    end
end

class Level
    
end

class Vehicles
    def initialize(liscense_plate, spot_num)

    end

end

class Compact < Vehicles
    def initialize
    end
end


class Larger < Vehicles
    def initialize
end


-------------------ANSWER-------------------------------

class Vehicle
  attr_reader :spots_needed, :size

  def initialize(license_plate)
    @parking_spots = []
    @license_plate = license_plate
  end

  def park_in_spot(spot)
    # ...
  end

  def clear_spots
    # ...
  end

  def can_fit_in_spot(spot)
    # ...
  end
end

class Bus < Vehicle
  def initialize
    super
    @spots_needed = 5
    @size = :large
  end

  def can_fit_in_spot(spot)
    # Checks if spot is :large
  end
end

class Car < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end

  def can_fit_in_spot(spot)
    # Check if spot is :compact or :large
  end
end

class Motorcycle < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class ParkingLot
  def initialize
    @levels = # generate_levels
  end

  def park_vehicle(vehicle)
    # Park the vehicle in a spot or multiple spots. Return false if failed.
  end
end

class Level
  def initialize(floor, num_spots)
    @spots = # generate spots
    @available_spots = num_spots
    @floor = floor
  end

  def park_vehicle(vehicle)
    # Find a place to park vehicle or return false.
  end

  def park_starting_at(spot_num, vehicle)
    # Park a vehicle starting at spot number and continue until vehicle.spots_needed.
  end

  def find_available_spots(vehicle)
    # Find a spot to park the vehicle. Return index of spot or -1.
  end

  def spot_freed
    @available_spots += 1
  end
end

class ParkingSpot
  attr_reader :row, :spot_num

  def initialize(size, level, row, spot_num)
    @vehicle = nil
    @spot_size = size
    @level = level
    @row = row
    @spot_num = spot_num
  end

  def is_free?
    !@vehicle
  end

  def can_fit_vehicle?(vehicle)
    # Check it will fit.
  end

  def park(vehicle)
    # Park in spot
  end

  def unpark
    # Remove vehicle from spot and notify level that a new spot is available.
  end
end

-------------------------------------------------------------------------------------

n1 = Node.new(1) making a node with a value of 1

n1.bfs(1) #=> n1



class Node 

    def bfs(&prc)
        queue = [self]
        until queue.empty?
            current_node = queue.first
            if prc.call(current_node)
                return current_node 
            else  
                queue << current_node.children
                queue.shift 
            end 
        end 
        nil 
        
    end 
end 

-------------------------ANSWER--------------------------------------------

class Node

  # -- Assume nodes have a value, and a attr_reader on value
  # -- Also, assume there are working parent/child-related methods for Node

  def bfs(&prc)
    raise "Must give a proc or target" if prc.nil?

    queue = [self]

    until queue.empty?
      visited = queue.shift
      return visited if prc.call(visited)
      queue += visited.children
    end

    nil
  end
end

------------------------------------------------------------------------

n1 = Node.new(1) #making a node with a value of 1

n1.dfs { |node| node.value == 1 } #=> n1 (found a node with value == 1)



class Node

    def dfs(target, &prc)
        raise "Must give a proc or target" if prc.nil?
        return self if prc.call(self)
        self.children.each do |child|
            result = child.dfs(target, &prc)
            return result if !result.nil?
        end
        nil

    end

#     def dfs(, &prc)
#     raise "Must give a proc or target" if prc.nil?

#     return self if prc.call(self)

#     self.children.each do |node|
#       result = node.dfs(target, &prc)
#       return result if result
#     end

#     nil
#   end
end
