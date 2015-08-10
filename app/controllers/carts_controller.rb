class CartsController < ApplicationController
  before_action :set_cart, :only => [:show, :destroy]

  def show
  end

  def destroy
    current_cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_url, notice: 'Your cart is empty now!') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      begin
        @cart = Cart.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(root_url, :notice => 'The cart not found!')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit
    end
end
