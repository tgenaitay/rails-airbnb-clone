class OrdersController < ApplicationController
before_action :set_menu, only: [:new, :create]
before_action :set_order, only: [:destroy, :approve, :reject]

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def chef_index
    # @orders = current_user.menus.orders.sort { |x,y| y.created_at <=> x.created_at }
    #@orders = Order.joins("INNER JOIN menus ON orders.menu_id = menus.id AND menus.user_id = #{current_user.id}")
    @orders = Order.joins(:menu).where("menus.user_id = ?", current_user.id)
  end

  def approve
    redirect_to(chef_orders_path, alert: 'This order is not yours, fellow !') unless @order.menu.user_id == current_user.id
    if @order.update(approved:true)
      redirect_to chef_orders_path, notice: "Order approved ! It's time to shop your ingredients ..."
    else
      redirect_to chef_index_path, notice: "Sorry, this order is not to approvable"
    end
  end

  def reject
    redirect_to(chef_orders_path, alert: 'This order is not yours, fellow !') unless @order.menu.user_id == current_user.id
    if @order.update(approved:false)
      redirect_to chef_orders_path, notice: "Order rejected ! Are you really a Chef dude ?"
    else
      redirect_to chef_index_path, notice: "Sorry, this order is not rejectable"
    end
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
      redirect_to orders_path, notice: 'Your order is submitted for approval'
    else
      render "menus/show"
    end
  end

  def destroy
    message = 'This order is not yours, fellow !'
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
