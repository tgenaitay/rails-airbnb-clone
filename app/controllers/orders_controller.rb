class OrdersController < ApplicationController
before_action :set_menu, only: [:new, :create]

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    set_menu
    @order = Order.new
    @order.menu = @menu
  end

  def create
    @order = Order.new(orders_params)
    @order.menu = @menu
    @order.user = current_user
    @order.date = @menu.availability
    if @order.save
      redirect_to orders_path, notice: 'Your order is submitted for approval '
    else
      render :new
    end
  end

  def destroy
    set_order
    message = ''
    if @order.user_id == current_user.id
      @order.destroy
      message = 'Your order has been successfully deleted'
    end
    redirect_to orders_path, notice: message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_menu
      @menu = Menu.find(params[:menu_id])
  end

  def set_order
      @order = Order.find(params[:id])
  end

  def orders_params
      params.require(:order).permit(:portions)
    end

end
