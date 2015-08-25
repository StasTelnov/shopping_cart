class Cart < ActiveRecord::Base
  has_many :line_items, :dependent  => :destroy
  has_many :products,   :through    => :line_items

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_price_with_discount
    line_items.to_a.sum { |item| item.total_price_with_discount }
  end

  def quantity
    line_items.sum(:quantity)
  end

  def self.current_cart(id)
    find(id)
  end

end
