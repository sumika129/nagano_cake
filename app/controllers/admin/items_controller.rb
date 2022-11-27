class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @book.save
  end

  def index
    @item = Item.all
  end

  def show
    @item = I.find(params[:id])
  end

  def edit
  end
end
