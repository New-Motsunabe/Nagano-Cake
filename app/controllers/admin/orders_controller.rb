class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordered_product = OrderedProduct.where(order_id: params[:id])
    @total = @ordered_product.sum(:tax_price) * @ordered_product.sum(:amount)
    @total_price = @total + @order.shipping
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order.change_work_status
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
