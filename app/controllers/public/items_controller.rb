class Public::ItemsController < ApplicationController
  def index
    @genren = Genre.all
    @items = Item.all
  end

  def show
  end
end
