class Public::ShippingAddressesController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    @shipping_addresses = @customer.shipping_addresses.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "You have updated user successfully."
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
    if @book.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.delete
    redirect_to shipping_addresses_path, notice: "You have updated user successfully."
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:zip_code, :address, :name, :customer_id)
  end
end
