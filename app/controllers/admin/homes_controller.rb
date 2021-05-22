class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

 def top
  @customer = params[:customer_id]
    if @customer
       @orders = Order.where(customer_id: @customer)
       #@amount = @orders.ordered_products.sum
    else
       @orders = Order.all
       #@amount = @orders.ordered_products.sum
    end
 end

end
