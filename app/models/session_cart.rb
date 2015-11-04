class SessionCart
  def initialize store
    @store = store
    @store[:items] ||= []
  end

  def items
    Product.find @store[:items]
  end

  def add product
    @store[:items].push product.id
  end

  def item_count
    @store[:items].count
  end
end
