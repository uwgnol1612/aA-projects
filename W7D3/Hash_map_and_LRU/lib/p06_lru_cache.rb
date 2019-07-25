require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
      node = @map[key]
      if node.nil?
        calc!(key)
      else  
        update_node!(node)
      end  

  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    new_node = @store.append(key, val)
    @map[key] = new_node



    if @store.count > @max 
      eject!
    end

    val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
    
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)
  end
end
