class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "数量の変更を保存しました"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "商品の削除に成功しました"
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path, notice: "カート内を空にしました"
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if @cart_item.item_id == cart_item.item_id
        if @cart_item.quantity != nil
          cart_item.update(quantity: @cart_item.quantity + cart_item.quantity)
          @cart_item.delete
        end
      end
    end
    if @cart_item.quantity != nil
      @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to item_path(@cart_item.item), alert: "※商品の個数を選択してください"
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
