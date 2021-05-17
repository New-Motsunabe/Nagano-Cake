class Admin::HomesController < ApplicationController
  
  def top
    case params[:order_sort]
      when "1"
       @user = User.find(params[:user_id])
       @orders = @user.orders
    else
       @orders = Order.all
    end
    @posts = posts.page(params[:page])
  end
end
