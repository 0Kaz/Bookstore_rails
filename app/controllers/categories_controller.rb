class CategoriesController < ApplicationController
  before_action :set_category_id, only:[:edit,:show,:update, :destroy]

  def new
    @page_title = "Add New Category"
    @category = Category.new
  end

  def create
    @category = Category.new(set_category_params)
    if @category.save
      flash[:notice] = "Category Created"

      redirect_to new_category_path
    else
      render :new
    end
  end

  def update
    @category.update(set_category_params)

    flash[:notice] = "Category Edited"

    redirect_to categories_path
  end

  def edit
    @page_title = "Edit the category"
  end

  def destroy
    @category.destroy

    flash[:notice] = "Category Removed"

    redirect_to categories_path
  end

  def index
    @categories = Category.all
    @page_title = "All Categories"
  end

  def show
    @categories = Category.all
    @books = @category.books
  end

  private

  def set_category_params
    params.require(:category).permit(:name)
  end


  def set_category_id
    @category = Category.find(params[:id])

  end
end
