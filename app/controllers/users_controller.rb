class UsersController < ApplicationController
  include Pundit
  def update
    @user = User.find(params[:id])
  end
end
