class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @oeder_detail = @order.oeder_details
  end

  def update
    @order = Order.find(params[:id])
    @oeder_detail = @order.oeder_details
    #params[:order][:status] = params[:order][:status].to_i
    if @order.update(order_params) && @order.status == "confirmation"
      #@oeder_detail.each do |oeder_detail|
        #oeder_detail.update(making_status: "waiting")
      #end
      @oeder_detail.update_all(making_status: "waiting")
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
