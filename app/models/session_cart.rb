class SessionCart
  def initialize store
    @store = store
    @store[:items] ||= []
  end

  def items
    @store[:items]
  end

  def add product
    items.push product
  end
end
