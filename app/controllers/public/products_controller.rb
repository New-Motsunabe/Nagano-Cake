class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_active: true).page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

private
	def product_params
		parmas.require(:product).permit(:image ,:name, :introduction, :price, :is_active)
	end
end
