class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def new
  end

  def create
  end

end
