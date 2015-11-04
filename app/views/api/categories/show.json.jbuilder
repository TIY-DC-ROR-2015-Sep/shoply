json.id @category.id
json.name @category.name

json.products @category.products do |p|
  json.(p, :id, :name, :description, :created_at)
  json.price display_price(p)
end
