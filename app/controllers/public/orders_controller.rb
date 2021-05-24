class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm #注文情報の確認画面を表示する
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
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @total = @cart_items.sum{|cart_item|cart_item.product.price * cart_item.amount * 1.1}
      @product = Product.where(product_id: params[:id])
      @total_price = @total + @order.shipping
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @ordered_products = @order.ordered_products.new
      @ordered_products.product_id = cart_item.product.id
      @ordered_products.tax_price = cart_item.product.price * 1.1
      @ordered_products.amount = cart_item.amount
      @ordered_products.save
      current_customer.cart_items.destroy_all
    end
    redirect_to orders_complete_path
  end

  def complete #注文完了画面
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)

  end

  def show
    @order = Order.find(params[:id])
    @ordered_product = OrderedProduct.where(order_id: params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :residence, :address_name,:postal_code, :total_price)
  end

end
