class Admin::CustomersController < ApplicationController
  #before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer),notice: "変更を保存しました"
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number)
  end

end