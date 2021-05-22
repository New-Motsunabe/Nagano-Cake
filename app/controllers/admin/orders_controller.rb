class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordered_product = OrderedProduct.where(order_id: params[:id])
    #@amount = @order.ordered_products.sum
    #@total = @ordered_product.sum{|ordered_product|ordered_products.tax_price * ordered_products.amount * 1.1}
    #@total_price = @total + @order.shipping
  end

  def update
    order = Order.find(params[:id])
    
    order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
