class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end
  def update
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