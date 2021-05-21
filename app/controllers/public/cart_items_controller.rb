class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.sum{|cart_item|cart_item.product.price * cart_item.amount * 1.1}
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @update_cart_item =  CartItem.find_by(product: @cart_item.product)
    if @update_cart_item.present? && @cart_item.valid?
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end

    if @cart_item.save
      flash[:notice] = "#{@cart_item.product.name}をカートに追加しました"
      redirect_to products_path
    else
      @product = @cart_item.product
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
      render "public/products/show"
    end

  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    flash[:destroy] = "#{@cart_items.product.name}を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :amount, :customer_id)
  end

end
