class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:residence_option] == "0"
     @order.residence = current_customer.residence
     @order.postal_code = current_customer.postal_code
     @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:residence_option] == "1"
     @shipping_addresses = ShippingAddress.find_by(params[:order][:shipping_address_id])
     @order.residence = @shipping_addresses.residence
     @order.postal_code = @shipping_addresses.postal_code
     @order.address_name = @shipping_addresses.address_name
    else
     @order.residence = params[:order][:residence]
     @order.postal_code = params[:order][:postal_code]
     @order.address_name = params[:order][:address_name]
    end
    @cart_items = CartItem.find_by(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@ordered_product = OrderedProduct.find(params[:ordered_product.id])
    @order.save
    redirect_to orders_complete_path
  end

  def complete

  end

  def index
    @orders = Order.all
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @total_price = @order.order_products.sum(:tax_price) + shipping
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :residence, :address_name,:postal_code)
  end


end
