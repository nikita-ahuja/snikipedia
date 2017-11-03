class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]


  def index
    logged_in?
    @categories = Category.all
  end

  def show
    logged_in?
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

   def edit
   end

   def create
   end

   def update
   end

   def destroy
   end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def user_params
    params.require(:category).permit(:name, :description)
  end


end
