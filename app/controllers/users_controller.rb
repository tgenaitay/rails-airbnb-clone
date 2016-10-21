class UsersController < ApplicationController
  def update
    # mettre a jour user...
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to new_menu_path
  end

  def user_params
    params.require(:user).permit(:description, :photo)
  end

end
