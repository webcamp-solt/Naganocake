class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.zip_code = current_customer.zip_code
      @order.name = current_customer.full_name
      @order.address = current_customer.address

    elsif params[:order][:address_option] == "1"
      ship = ShippingAddress.find(params[:order][:address_id])
      @order.address = ship.address
      @order.zip_code = ship.zip_code
      @order.name = ship.name

    elsif params[:order][:address_option] == "2"
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @order.zip_code = params[:order][:zip_code]

    else
      render :new
    end

    @cart_items = current_customer.cart_items.all
    @order.delivery_money = 800
    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.item.with_tax_price * cart_item.quantity
    end
    @order.items_total = @total
    @order.customer_id = current_customer.id
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.quantity = cart_item.quantity
      @ordered_item.tax_price = cart_item.item.with_tax_price
      @ordered_item.order_id = @order.id
      @ordered_item.save
    end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :zip_code, :name, :address, :customer_id, :order_status, :items_total, :delivery_money)
  end
end