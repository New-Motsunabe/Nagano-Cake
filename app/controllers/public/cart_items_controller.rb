class Public::CartItemsController < ApplicationController
  def index
    # @cart_items = CartItem.find(params[:id])
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @update_cart_item =  CartItem.find_by(product: @cart_item.product)
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_item.customer_id = current_customer.id
    # @cart_item.product_id = params[:product_id]
    if @update_cart_item.present? && @cart_item.valid?
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end

    if @cart_item.save
      flash[:notice] = "#{@cart_item.product.name}をカートに追加しました"
      redirect_to products_path
    else
      # @product = Product.find(params[:cart_item_][:product_id])
      # @cart_item = CartItem.new
      @product = @cart_item.product
      # @product = Product.find(params[:cart_item][:product_id])
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
    # @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :amount, :customer_id)
  end

end