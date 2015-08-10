class ProductsSale < Base::VersionModel
  belongs_to :product
  belongs_to :sale
end
