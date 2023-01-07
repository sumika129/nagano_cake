class Admin::OrderDetailsController < ApplicationController

  def update
    @oeder_detail = OederDetail.find(params[:id])
    @order = @oeder_detail.order
    @total = 0
    @postage = 800

    @oeder_details = @order.oeder_details.all
    #is_updated = true
    if @oeder_detail.update(oeder_detail_params)
      @order.update(status: "production") if @oeder_detail.making_status == "production"
      #@oeder_details.each do |oeder_detail|
        #if oeder_detail.making_status != "complete"
          #is_updated = false
        #end
      #end
      @order.update(status: "preparation") if @oeder_details.count == @oeder_details.where(making_status: "complete").count

      #@order.update(status: "preparation") if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def oeder_detail_params
    params.require(:oeder_detail).permit(:making_status)
  end
end
