class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
       flash.now[:notice] = "Your wiki was saved."
       redirect_to @wiki
    else
      flash.now[:alert] = "Error, your wiki was not created. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
      authorize @wiki
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
<<<<<<< Updated upstream
      params.require(:wiki).permit(:title, :body, :public)
=======
      params.require(:wiki).permit(:title, :body)
>>>>>>> Stashed changes
    end
end
