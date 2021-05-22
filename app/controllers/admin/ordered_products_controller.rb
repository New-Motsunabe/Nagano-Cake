class Admin::OrderedProductsController < ApplicationController


  def update
   order = Order.find(params[:order_id])
   ordered_product = order.ordered_product
   ordered_product.update(ordered_product_params)
   redirect_back(fallback_location: root_path)
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:work_status)
  end

end
