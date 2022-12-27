class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.new(order_params)
    @total = 0
    @postage = 800
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
