class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, 

  def show

  end

  def edit

  end

  def unsubscribe

  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
