class LineItemsController < ApplicationController
  before_action :set_line_item, :only => [:update]

  def create
    product = Product.find(line_item_params[:product_id])
    @line_item = current_cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.js
      else
        format.html { redirect_to(root_url, :error => @line_item.errors) }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.js
      else
        format.html { redirect_to(root_url, :error => @line_item.errors) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      begin
        @line_item = LineItem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(root_url, :notice => 'The Line Item not found!')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end
end
