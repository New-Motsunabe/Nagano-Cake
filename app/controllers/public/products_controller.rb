class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_active: true).page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(prams[:id])
    @cart_item = CartItem.new
  end

end
