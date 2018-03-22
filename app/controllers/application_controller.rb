class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  after_initialize :init

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  enum role: [:standard, :premium, :admin]
end
