class Admin::HomesController < ApplicationController

  def top
    case params[:order_sort]
      when "1"
       @customer = Customer.find(params[:customer_id])
       @orders = @customer.orders
    else
       @orders = Order.all
    end
    @orders = Order.page(params[:page]).reverse_order
  end
end
