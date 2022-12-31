class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @oeder_detail = @order.oeder_details
  end

  def update
    @order = Order.find(params[:id])
    @oeder_detail = @order.oeder_details
    if @order.update(order_params)
      @oeder_detail.update_all(making_status: 1) if @order.status == "confirmation"
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
