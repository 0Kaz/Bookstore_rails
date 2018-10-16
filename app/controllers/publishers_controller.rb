class PublishersController < ApplicationController
  def index

  end

  def new
    @page_title = "Add New Publisher"
    @publisher = Publisher.new
  end

  def create

    @publisher = Publisher.new(set_publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher added."
      redirect_to publishers_path
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

  def set_publisher_params
    params.require(:publisher).permit(:name)
  end


end
