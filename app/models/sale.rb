class Sale < Base::VersionModel
  has_many :products_sales, :dependent  => :destroy
  has_many :products,       :through    => :products_sales
end
