class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :landingchef]

  def landingchef
    @user = User.find(params[:id])
    redirect_to :back, alert: 'FORBIDDEN, you can not view profile for non-chef user!' unless @user.is_chef?
  end

  def chef
    @user = current_user
  end

  def home
    @menus = Menu.all
  end
end


