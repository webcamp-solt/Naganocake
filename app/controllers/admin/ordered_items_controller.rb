class Admin::OrderedItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(ordered_item_params)
    @ordered_items = OrderedItem.where(order_id: @ordered_item.order.id)
    @array = []
    @count = 0
    @ordered_items.each do |ordered_item|
      @array << ordered_item.production_status
      @count = @count + 1
    end
    if @ordered_item.production_status == "in_production"
      @ordered_item.order.update(order_status: "in_production")
    elsif @array.join == "production_completed" * @count
      @ordered_item.order.update(order_status: "ready_to_ship")
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
end
