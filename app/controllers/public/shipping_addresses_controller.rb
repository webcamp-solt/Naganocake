class Public::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @shipping_addresses = @customer.shipping_addresses.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "配送先の登録に成功しました"
    else
      @shipping_addresses = ShippingAddress.all
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end


  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.delete
    redirect_to shipping_addresses_path, notice: "配送先の削除に成功しました"
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:zip_code, :address, :name, :customer_id)
  end
end
