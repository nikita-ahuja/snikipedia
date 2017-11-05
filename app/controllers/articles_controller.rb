require 'open-uri'

class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :show, :update, :destroy]
	# before_action :set_article, only: :show
	skip_before_action :require_login, only: [:index, :search, :show]

	require "wikipedia"

	## WORKS PERFECTLY WITHOUT WIKI-SEARCH API.  WILL TRY TO IMPLEMENT IT IN LOWER VERSION.
	# def index
	# 	@articles = Article.text_search(params[:query])
	#
	# 	respond_to do |format|
	# 		format.html
	# 		format.js
	# 	end
	#
	# end


	## TRYING TO IMPLEMENT WIKI-SEARCH RESULTS INTO REGULAR RESULTS.
	def index

		if params[:query]
			wiki_api_result = Wikipedia.find(params[:query])
			wiki_article_hash = {title: wiki_api_result.title,
				body: wiki_api_result.text,
				summary: wiki_api_result.summary,
				title: wiki_api_result.title,
				status: "pending" }

			wiki_article_object = Article.new(wiki_article_hash)
			if @current_user
				wiki_article_object.user = @current_user
			else
				wiki_article_object.user = User.where(role: 'admin').first
			end

			wiki_article_object.save
			@articles = Article.text_search(params[:query])

			#### BELOW IS BETA - TRYING TO SAVE WIKI IMAGE TO PAPERCLIP
			# saved_wiki_article = Article.all.last
			# wiki_image_links = wiki_api_result.image_urls

			# if wiki_image_links
			# 	if wiki_image_links.count > 2
			# 		wiki_images = wiki_image_links[0..1]
			# 	else
			# 		wiki_images = wiki_image_links
			# 	end

				# photo_bucket = []
				# wiki_images.each do |wiki_image_link|
				# 	binding.pry
				# 	this_image = open(url)
					# { title: wiki_image, image_file_name: wiki_image }
					# wiki_article_object.photos << open(url)
					# wiki_article_object.picture_from_url "http://www.google.com/images/logos/ps_logo2.png"
					# agent = Mechanize.new
					# wiki_image = agent.get(wiki_image_link).save
					# saved_image_attributes = { title: wiki_image, image_file_name: wiki_image }
					# new_image = Photo.new(saved_image_attributes)
					# new_image.user = @current_user
					# new_image.article = Article.all.last
					# new_image.article = wiki_article_object
					# new_image.save
			# 	end
			# end
			# saved_wiki_article.photos << photo_bucket
			# wiki_article_object.save
			# @articles = Article.text_search(params[:query])
			# https://stackoverflow.com/questions/1074309/how-do-i-download-a-picture-using-ruby
			#### ABOVE IS BETA - TRYING TO SAVE WIKI IMAGE TO PAPERCLIP

		else
		  @articles = Article.all
		end

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

		respond_to do |format|
			if @article.save
				format.html { redirect_to @article, notice: 'Article was successfully created.' }
				format.json { render :show, status: :created, location: @article }
			else
				format.html { render :new }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	# def update
  #   if @article.update_attributes(article_params)
  #     flash[:notice] = "Successfully updated article!"
  #    	redirect_to article_path(@article)
  #   else
  #     flash[:alert] = "Error updating article!"
  #     render "edit"
  #   end
  # end


	def update
    respond_to do |format|
      if @article.update(restaurant_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
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
