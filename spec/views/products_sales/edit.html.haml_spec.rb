require 'rails_helper'

RSpec.describe "products_sales/edit", type: :view do
  before(:each) do
    @products_sale = assign(:products_sale, ProductsSale.create!())
  end

  it "renders the edit products_sale form" do
    render

    assert_select "form[action=?][method=?]", products_sale_path(@products_sale), "post" do
    end
  end
end
