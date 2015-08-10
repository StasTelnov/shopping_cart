require 'rails_helper'

RSpec.describe "products_sales/new", type: :view do
  before(:each) do
    assign(:products_sale, ProductsSale.new())
  end

  it "renders new products_sale form" do
    render

    assert_select "form[action=?][method=?]", products_sales_path, "post" do
    end
  end
end
