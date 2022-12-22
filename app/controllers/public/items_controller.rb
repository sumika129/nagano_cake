class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page])
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
    @cart_item = current_customer.cart_items.new
  
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
end


