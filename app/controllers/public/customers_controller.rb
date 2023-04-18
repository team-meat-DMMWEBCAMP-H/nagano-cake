class Public::CustomersController < ApplicationController
  #before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customer_my_page_path, notice: "変更が成功しました。"
  end

  def check
    @customer = current_customer
    # is_activeカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

end