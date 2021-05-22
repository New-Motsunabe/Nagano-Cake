class Admin::OrderedProductsController < ApplicationController


  def update
    # order = Order.where(customer_id: params[:id])
    ordered_product = OrderedProduct.find(params[:id])
    ordered_product.update(ordered_product_params)
    
    redirect_back(fallback_location: root_path)
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:work_status)
  end

end
