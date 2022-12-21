class Public::HomesController < ApplicationController

  def top
    @genre = Genre.all
    @item = Item.order('id DESC').limit(4)
  end

  def about
  end

end
