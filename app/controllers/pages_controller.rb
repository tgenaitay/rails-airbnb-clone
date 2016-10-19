class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:chef, :home]
  def chef
    @user = User.find(params[:id])
    redirect_to :back, alert: 'FORBIDDEN, you can not view profile for non-chef user!' unless @user.is_chef?
  end
end


