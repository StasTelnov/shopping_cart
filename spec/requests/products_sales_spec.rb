require 'rails_helper'

RSpec.describe "ProductsSales", type: :request do
  describe "GET /products_sales" do
    it "works! (now write some real specs)" do
      get products_sales_path
      expect(response).to have_http_status(200)
    end
  end
end
