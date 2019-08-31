class Bench < ApplicationRecord
  def self.in_bounds(bounds)

    Bench.where("lat BETWEEN ? AND ?", bounds["southWest"]["lat"].to_f, bounds["northEast"]["lat"].to_f)
    .where("lng BETWEEN ? AND ?", bounds["southWest"]["lng"].to_f, bounds["northEast"]["lng"].to_f)

  end
end

 
# bounds = {
#     "northEast"=> {"lat"=>"40.80971", "lng"=>"-120.39208"},
#     "southWest"=> {"lat"=>"35.74187", "lng"=>"-124.47791"}
#  }

# Bench.where("lat >= :min_lat AND lat <= :max_lat AND lng >= :min_lng AND lng <= :max_lng")
#   {maxlat: bounds["southWest"]["lat"], min_lat: bounds["northEast"]["lat"], 
#    min_lng: bounds["southWest"]["lng"], max_lng: bounds["northEast"]["lng"]}




