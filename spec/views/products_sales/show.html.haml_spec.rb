require 'rails_helper'

RSpec.describe "products_sales/show", type: :view do
  before(:each) do
    @products_sale = assign(:products_sale, ProductsSale.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
