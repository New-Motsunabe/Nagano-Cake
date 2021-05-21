class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except:[:top, :about ]
  def top
    @products = Product.all.order(created_at: :desc)
  end
end
