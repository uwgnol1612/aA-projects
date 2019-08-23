
json.extract! @guest, :name, :age, :favorite_color

# json.array! @guest.gifts do |gift|
#   json.extract! gift, :title, :description
# end
# @guest.gifts do |gift|

# json.gifts @guest.gifts, partial: 'api/gifts/gift'

json.gifts do
    json.array! @guest.gifts, :title, :description
end 

# json.partial! "/api/guests/guest", guest: guest

#   if gift.guest_id == @guest.id
#     # json.extract! gift, 
#     json.title gift.title 
#     json.description gift.description
#   end 
# end 
