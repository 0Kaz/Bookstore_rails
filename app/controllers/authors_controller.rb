class AuthorsController < ApplicationController
  def index

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
  end

  def edit
  end

  def destroy
  end


  def show
  end


  private

  def set_author_params
    params.require(:author).permit(:first_name, :last_name)
  end


end
