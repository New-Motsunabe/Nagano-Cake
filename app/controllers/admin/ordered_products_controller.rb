class Admin::OrderedProductsController < ApplicationController


  def update
    ordered_product = OrderedProduct.find(params[:id])
    ordered_product.update(ordered_product_params)
    ordered_product.change_order_status#change_order_statusメソッドはordered_productモデルに定義してます。
    redirect_back(fallback_location: root_path)
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:work_status)
  end

end
