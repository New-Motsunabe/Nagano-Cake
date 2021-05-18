class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = current_customer.shipping_address
  	@shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @genre.save
      flash[:notice] = "登録されました"
      redirect_to admin_genres_path
    else
      @genres = Genres.all
      render :index and return
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

end
