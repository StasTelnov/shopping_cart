FactoryGirl.define do
  factory :products_sale do
    sale    { Sale.offset(rand(Sale.count)).first }
    product { Product.where.not(:id => sale.product_ids).first }
  end

end
