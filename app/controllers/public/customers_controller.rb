class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, 

  def show
  end

  def edit
  end

  def unsubscribe　#退会確認画面を表示する
  end

  def withdraw　#退会処理（ステータスの更新）
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
