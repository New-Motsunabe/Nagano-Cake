class Admin::OrderedProductsController < ApplicationController


  def update
   order = Order.find(params[:order_id])
   ordered_product = order.ordered_product
   ordered_product.update(ordered_product_params)
   redirect_back(fallback_location: root_path)
  end

  def ordered_products
    @order = Order.find(params[:product_id])
    @ordered_products = @order.ordered_products
    byebug
  end

  def ordereds
    @order = Order.find(params[:order_id])
    @orders = @order.ordereds
  end


  private

  def ordered_product_params
    params.require(:ordered_product).permit(:work_status)
  end

end
