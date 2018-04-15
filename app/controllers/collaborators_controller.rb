class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:collaborator][:user])
    @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
    if @wiki.collaborators.exists?(user_id: @user.id)
      flash[:alert] = "Collaborator already exists"
    elsif @collaborator.save
      flash[:notice] = "Collaborator added"
    end
    redirect_to @wiki
  end
  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator had been removed."
      redirect_to root_path
    else
      flash.now[:alert] = "Collaborator could not be removed."
      redirect_to root_path
    end
  end
end
