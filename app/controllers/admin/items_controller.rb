class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to 'items_path'
    else
      render:index
    end
  end

  def index
    @item = Item.all
  end

  def show
    @item = I.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:params).permit(:name, :introduction, :price)
  end
end
