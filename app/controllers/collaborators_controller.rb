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
end
