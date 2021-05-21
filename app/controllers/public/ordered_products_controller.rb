class Public::OrderedProductsController < ApplicationController
  before_action :authenticate_customer!
end
