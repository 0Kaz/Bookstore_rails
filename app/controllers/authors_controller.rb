class AuthorsController < ApplicationController
  def index

  end

  def new
    @page_title = "Add New Author"
    @author = Author.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end


  def show
  end

end
