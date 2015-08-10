class ProductsController < ApplicationController
  before_action :set_product, :only => [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      begin
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(root_url, :notice => 'The Product not found!')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit
    end
end
