json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :image_url, :item_ids
    json.items do 
      json.array! @pokemon.items
    end
end 



