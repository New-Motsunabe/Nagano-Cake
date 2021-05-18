class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_active :ture).page(params[:page]).per(8)
    @quantity = Product.
  end
end
