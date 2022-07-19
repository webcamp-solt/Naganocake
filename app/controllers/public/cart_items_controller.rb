class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
