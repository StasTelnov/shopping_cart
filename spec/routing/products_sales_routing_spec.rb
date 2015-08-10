require "rails_helper"

RSpec.describe ProductsSalesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_sales").to route_to("products_sales#index")
    end

    it "routes to #new" do
      expect(:get => "/products_sales/new").to route_to("products_sales#new")
    end

    it "routes to #show" do
      expect(:get => "/products_sales/1").to route_to("products_sales#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_sales/1/edit").to route_to("products_sales#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_sales").to route_to("products_sales#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products_sales/1").to route_to("products_sales#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products_sales/1").to route_to("products_sales#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_sales/1").to route_to("products_sales#destroy", :id => "1")
    end

  end
end
