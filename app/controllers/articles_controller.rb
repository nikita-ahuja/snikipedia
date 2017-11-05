class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :show, :update, :destroy]
	# before_action :set_article, only: :show
	skip_before_action :require_login, only: [:index, :search, :show]
	require "wikipedia"

	def index
		@articles = Article.text_search(params[:query])

		respond_to do |format|
			format.html
			format.js
		end

	end

	def show
		respond_to do |format|
      format.html
      format.js
    end
	end

	#
	# def show
	# 	if params[:search]
	# 		@search = Wikipedia.find(params[:search])
	# 		@wiki_photos = @search.image_urls
	# 		@article = Article.new(title: @search.title, body: @search.text, summary: @search.summary, user_id: 1, status: "pending")
	# 	else
	# 		@article = Article.find(params[:id])
	# 		respond_to do |format|
	# 			format.html # show.html.erb
	# 			format.js # show.js.erb
	# 		end
	# 	# @article = Article.find(params[:id])
	# 	respond_to do |format|
	# 		format.html # show.html.erb
	# 		format.js # show.js.erb
	# 	end
	#
	# 		@user = User.find_by(id: session[:user_id])
	# 	end
	# end

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
			params.require(:article).permit(:title, :body, :summary, :user_id, :tag_list, article_category_ids: [])
		end

end
