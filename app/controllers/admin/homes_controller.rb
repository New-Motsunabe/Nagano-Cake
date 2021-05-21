class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

 def top
    case params[:order_sort]
      when "1"
       @customer = Customer.find(params[:id])
       @orders = @customer.orders
    else
       @orders = Order.all
    end
    @orders = Order.page(params[:page]).reverse_order
 end

end
