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
    @menus = @menus.select { |menu| menu.user.city.downcase == params[:city].downcase } if ( params[:city] && !params[:city].empty?)
    @total = @menus.count


    @users = User.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

  def mymenus
    @menus = current_user.menus.order(:created_at)
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
      @menus = current_user.menus.order(:created_at)
      menu = @menus.find(params[:id])
      if menu.update(menu_params)
        redirect_to mymenus_path, notice: 'Your menu was successfully updated'
      else
        render :mymenus
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
