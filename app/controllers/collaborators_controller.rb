class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:collaborator][:user])
    @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
    if @collaborator.save
      flash[:notice] = "Collaborator added"
    else
      flash[:error] = "There was an error"
    end
    redirect_to root_path
  end
end
