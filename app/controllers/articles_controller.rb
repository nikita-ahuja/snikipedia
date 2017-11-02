class ArticlesController < ApplicationController

	def index
		@searched_articles = Article.search(params[:search])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		params['categories'].split(',').each do |category_string|
    	category = Category.find_or_create_by({ name: category_string.strip })
    	@aticle.categories << category
  	end
  	
		if @article.save
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title, :body, :summary, :user_id, :category_id)
		end

end