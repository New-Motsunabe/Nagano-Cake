class Admin::OrderedProductsController < ApplicationController
  def update
   order = Order.find(params[:id])
   ordered_product = order.ordered_product
  end  
  
end
