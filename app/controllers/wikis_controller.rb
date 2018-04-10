class WikisController < ApplicationController
  def index
    if current_user.premium?
      @wikis = policy_scope(Wiki)
    else
      @wikis = Wiki.where(private: false)
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params.merge(user_id: current_user.id))
    authorize @wiki
    if @wiki.save && current_user.premium?
      @wiki.update_attribute(:private, true)
      flash.now[:notice] = "Your wiki was saved."
      redirect_to @wiki
    elsif @wiki.save
      flash.now[:notice] = "Your wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error, your wiki was not created. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.assign_attributes(wiki_params)
    if @wiki.save
       flash.now[:notice] = "Your wiki was updated."
       redirect_to @wiki
    else
      flash.now[:alert] = "Error, your wiki was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
    def wiki_params
      params.require(:wiki).permit(:title, :body, :user_id, user_ids:[])
    end
end
