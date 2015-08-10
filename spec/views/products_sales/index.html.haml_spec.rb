require 'rails_helper'

RSpec.describe "products_sales/index", type: :view do
  before(:each) do
    assign(:products_sales, [
      ProductsSale.create!(),
      ProductsSale.create!()
    ])
  end

  it "renders a list of products_sales" do
    render
  end
end
