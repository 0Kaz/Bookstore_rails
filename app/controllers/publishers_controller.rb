class PublishersController < ApplicationController
  before_action :set_publisher_id, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.all
    @page_title = "All Publishers"
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
    @publisher.update(set_publisher_params)
    flash[:notice] = "Publisher updated"

    redirect_to publishers_path

  end

  def edit
    @page_title = "Edit Publisher"
  end

  def destroy
    @publisher.destroy
    flash[:notice] = "Publisher deleted!"

    redirect_to publishers_path
  end


  def show
  end


  private

  def set_publisher_params
    params.require(:publisher).permit(:name)
  end

  def set_publisher_id
    @publisher = Publisher.find(params[:id])
  end

end
