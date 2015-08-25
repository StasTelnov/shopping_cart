class Product < ActiveRecord::Base
  monetize :price_cents

  has_many :line_items
  has_many :products_sales, :dependent  => :destroy
  has_many :sales,          :through    => :products_sales

  before_destroy :ensure_not_referenced_by_any_line_item

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        true
      else
        errors.add(:classes, 'There is line item!')
        false
      end
    end

end
