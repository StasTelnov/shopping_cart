class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def sales
    product.sales.where('sales.quantity <= ?', quantity)
  end

  def total_price
    product.price * quantity
  end

  def discount
    sales.sum(:discount)
  end

  def total_price_with_discount
    total_price * (1 - discount / 100.0)
  end

end
