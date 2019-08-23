json.extract! @party, :name, :location

# json.guests do
#     json.array! @party.guests
# end 


# json.gifts do
#     json.array! @guest.gifts do 
#         json.array! @party.guests
#     end 
# end 

json.guests do 
    json.array! @party.guests do |guest|
        json.extract! guest, :name, :age
        json.gifts do
            json.array! guest.gifts, :title, :description
        end 
    end 
end 



 






   

