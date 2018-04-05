class UsersController < ApplicationController
  def downgrade
    current_user.update_attribute(:role, 'standard')
    @user = User.find(params[:id])
    @user.wikis.each do |w|
      w.update_attributes(private: false)
    end
    flash[:notice] = "#{current_user.email} you're account has been downgraded"
    redirect_to edit_user_registration_path
  end
end
