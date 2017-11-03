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
			# binding.pry
		end

		@user = User.find_by(id: session[:user_id])
	end

	def new
		@article = Article.new
		# binding.pry
	end

	def edit
	end

	def create
		############  Adam's Testing Below ########
		# selected_categories = params[:article][:categories].reject(&:blank?)
		# binding.pry
		# @article = Article.find_or_create_by(article_params)
		# binding.pry
		#
		# selected_categories.each do |category_string|
		# 	binding.pry
		# 	category = Category.find_or_create_by({ name: category_string.strip })
		# 	@aticle.categories << category
		# end
		# binding.pry
		############  Adam's Testing Above ########


		############  ORIGINAL BELOW ########
		@article = Article.new(article_params)

		# params['categories'].split(',').each do |category_string|
  #   	category = Category.find_or_create_by({ name: category_string.strip })
  #   	@aticle.categories << category
  # 	end

		# binding.pry
		if @article.save
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :body, :summary, :user_id, :category_id, :tag_list)

			############  Adam's Testing Below ########
			# params.require(:article).permit(:title, :body, :summary, :user_id, :category_id, :categories)
		end

end
