class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.residence = current_customer.residence
    @order.postal_code = current_customer.postal_code
    @order.address_name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.find_by(customer_id: current_customer.id)
    byebug
  end

  def create
    @order = Order.find(params[:id])
    @ordered_product = OrderedProduct.find(params[:ordered_product.id])
    order.save
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :residence, :address_name)
  end


end
