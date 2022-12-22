class Public::CartItemsController < ApplicationController
  def index
    @cart_item = Cart_item.all
    @item = @cart_item.item
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save!
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
