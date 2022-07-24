class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_status == "payment_confirmation"
        @order.ordered_items.update(production_status: "waiting_for_production")
      end
    redirect_back(fallback_location: root_path)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
