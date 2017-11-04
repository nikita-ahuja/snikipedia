class ArticlesController < ApplicationController
	# before_action :set_article, only: [:edit, :show, :update, :destroy]
	# before_action :set_article, only: :show
	# skip_before_action :require_login, only: [:index, :search, :show]
	# require "wikipedia"


	def index
		binding.pry

############
		# if params[:tag]
    # 	@tagged_articles = Article.tagged_with(params[:tag])
    # else
		# 	@searched_articles = Article.search(params[:search])
		# end

		# @articles = Article.all
		# redirect_to articles_path(@articles)

		# NEED TO CREATE METHOD FOR THIS, OR JUST LINK IT IN THE VIEW.
		# @articles = Article.tagged_with(params[:tag]

	end

	def search
		choice_hash
	end

	def selected_form_options
		choice_hash = {title: params[:title], body: params[:body], summary: params[:summary]}

    if choice_hash
      clean_choice_hash = {}
      choice_hash.each do |key, value|
        clean_choice_hash[key] = value if !value.nil? && value != ""
      end
      @selected_data = Article.where(clean_choice_hash)

    else # choice_hash is nil
      @selected_data = Article.all
      binding.pry
    end
    binding.pry

    @selected_data.filter(filtering_params(params))
    binding.pry

    @articles = @selected_data.filter(filtering_params(params))

    binding.pry

	end


	# def search
		# @products = Product.status("active").starts_with("Ruby") # => All active products whose names start with 'Ruby'
	  # @articles = Article.filter(params.slice(:title_starts_with))
		# binding.pry

		# @articles = Article.filter(params.slice(:status, :location, :starts_with))


		# ArticlesHelper.search(params)
		# helpers.full_name(@user)

		# @tagged_articles = Article.tagged_with(params[:tag])

	  # redirect_to articles_path(params[:q])
	# end

	# def search
	# 	binding.pry
	# 	# logged_in?
	# 	# UNTESTED!!!!!!!!
	#
	# 	@articles = Article.search(params[:search])
	# 	redirect_to articles_path(@articles)
	# end


	def show
		# logged_in?
		# if params[:search]
		# 	@search = Wikipedia.find(params[:search])
		# 	@wiki_photos = @search.image_urls
		# 	@article = Article.new(title: @search.title, body: @search.text, summary: @search.summary, user_id: 1, status: "pending")
		# else
		# 	@article = Article.find(params[:id])
		# 	respond_to do |format|
		# 		format.html # show.html.erb
		# 		format.js # show.js.erb
		# 	end
		# # @article = Article.find(params[:id])
		# respond_to do |format|
		# 	format.html # show.html.erb
		# 	format.js # show.js.erb
		# end
		#
		# 	@user = User.find_by(id: session[:user_id])
		# end
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

		# def set_article
		# 	@article = Article.find(params[:id])
		# end

	def article_params
		params.require(:article).permit(:title, :body, :summary, :user_id, :tag_list, article_category_ids: [])
	end

	def filtering_params(params)
		params.slice(:title, :body, :summary)
	end

end
