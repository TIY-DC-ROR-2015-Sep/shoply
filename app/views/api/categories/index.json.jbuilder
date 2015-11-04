json.categories @categories do |c|
  # json.(c, :id, :name)
  json.id    c.id
  json.name  c.name
end
