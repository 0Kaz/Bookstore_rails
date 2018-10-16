class AuthorsController < ApplicationController
  before_action :set_author_id, only: [:show, :edit, :update, :destroy]
  def index
    @authors = Author.all
  end

  def new
    @page_title = "Add New Author"
    @author = Author.new
  end

  def create

    @author = Author.new(set_author_params)
    if @author.save
      flash[:notice] = "Author added."
      redirect_to authors_path
    else
      render :new
    end
  end

  def update
    @author.update(set_author_params)
    flash[:notice] = "Author updated"
    redirect_to authors_path
  end

  def edit
    @page_title = "Edit Author"
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author removed"
    redirect_to authors_path
  end


  def show
  end


  private

  def set_author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def set_author_id
    @author = Author.find(params[:id])
  end
end
