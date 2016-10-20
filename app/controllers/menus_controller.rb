class MenusController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    portions = params[:portions]
    price = params[:price]
    # category = params[:category]
    date = params[:date]

    @menus = Menu.all

    # @menus = @menus.where(category: category) if category
    # @menus = @menus.where(availability: date) if date
    @menus = @menus.where("portions >= ? ", portions) unless portions.blank?
    @menus = @menus.where("price <= ? ", price) unless price.blank?
    @menus = @menus.select { |menu| menu.user.city == params[:city] } if params[:city]
    @total = @menus.count

  end

  def show
    @order = Order.new
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user = current_user

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Your menu was successfully created. It looks delicious' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Your menu was successfully updated.It looks delicious' }
        format.json { render :show, status: :ok, location: @cocktail }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Your menu was successfully destroyed. You did good, It was digusting :) LOL' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :description, :price, :portions, :availability, :photo, :category)
    end
end
