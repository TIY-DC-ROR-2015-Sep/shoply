json.results @products do |p|
  json.(p, :id, :name, :description)
  json.price display_price(p)
end
