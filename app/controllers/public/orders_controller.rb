class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :residence, :address_name)
  end


end
