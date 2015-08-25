class Sale < ActiveRecord::Base
  has_many :products_sales, :dependent  => :destroy
  has_many :products,       :through    => :products_sales
end
