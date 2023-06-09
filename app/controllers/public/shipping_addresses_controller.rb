class Public::ShippingAddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @shipping_addresses = @customer.shipping_addresses.page(params[:page])
    @shipping_address = @customer.shipping_addresses.build
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_addresses = current_customer.shipping_addresses
    if @shipping_address.save
      flash.now[:notice] = "新規配送先を登録しました"
     redirect_to shipping_addresses_path
    else
      render "index"
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:success] = "配送先を変更しました"
      redirect_to customers_shipping_addresses_path
    else
      render "edit"
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    @shipping_addresses = current_customer.shipping_addresses
    flash.now[:alert] = "配送先を削除しました"
   redirect_to public_shipping_addresses_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:zip_code, :address, :name)
  end
end