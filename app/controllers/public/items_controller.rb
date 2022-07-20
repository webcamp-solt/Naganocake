class Public::ItemsController < ApplicationController
  def index
    @genrens = Genre.all
    @items = Item.all
  end

  def show
  end
end
