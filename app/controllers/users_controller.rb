class UsersController < ApplicationController
  include Pundit
  def update
    @user = User.find(params[:id])
    @user.toggle!(:standard)
    flash[:success] = 'OK!'
    redirect_to root_path
  end
end
