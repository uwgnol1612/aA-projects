@benches.each do |bench|
  json.set! bench.id do
    json.extract! bench, :description, :lat, :lng, :id
  end
end
