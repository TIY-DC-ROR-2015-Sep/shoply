class SessionCart
  SESSION_KEY = :items

  def initialize store
    @store = store
    @store[SESSION_KEY] ||= []
  end

  def items
    Product.find @store[SESSION_KEY]
  end

  def add product
    @store[SESSION_KEY].push product.id
  end

  def item_count
    @store[SESSION_KEY].count
  end

  def clear
    @store[SESSION_KEY] = []
  end
end
