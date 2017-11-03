class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	skip_before_action :require_login, only: [:index, :show]


	def index
		logged_in?
		@searched_articles = Article.search(params[:search])
	end

	def show
		logged_in?
		# @article = Article.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.js # show.js.erb
		end
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(article_params)
 
		if @article.save
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	def update
    if @article.update_attributes(article_params)
      flash[:notice] = "Successfully updated article!"
     	redirect_to article_path(@article)
    else
      flash[:alert] = "Error updating article!"
      render "edit"
    end
  end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :body, :summary, :user_id, article_category_ids: [])
		end
end
