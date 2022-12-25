class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    
    @order = Order.new
    if params[:order][:select_address] == "a"
      
    elsif params[:order][:select_address] == "b"
      # 登録された住所を格納する処理
    elsif params[:order][:select_address] == "c"
      
    end
    # session [:order] =@order
  end

  def complete

  end

  def index
  end

  def show
  end
end
