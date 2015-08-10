module ApplicationHelper

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def current_cart_total_price_with_discount
    if current_cart.total_price_with_discount != current_cart.total_price
      result = []
      result << content_tag(:s, current_cart.total_price)
      result << current_cart.total_price_with_discount
      result.join(' ').html_safe
    else
      humanized_money_with_symbol(current_cart.total_price_with_discount)
    end
  end


end
