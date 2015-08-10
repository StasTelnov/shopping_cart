FactoryGirl.define do
  factory :products_sale do
    sale    { Sale.random_record}
    product { Product.where.not(:id => sale.product_ids).first }
  end

end
