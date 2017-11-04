class SearchController < ApplicationController
  # before_action :admin_only, only: [:index]

  def index
  end

  def search_articles
    ## Renders a search form, which posts to selected_article_search_fields route/method.
  end

  def selected_article_search_fields
    ## Takes submitted fields/input from search form and processes them below.
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


    # respond_to do |format|
    #   if @articles
    #     format.html { redirect_to articles_path, notice: 'Query Results' }
    #     format.json { render :'articles/articles_partial', status: :ok, location: @articles }
    #   else
    #     format.html
    #     format.json
    #   end
    # end



    # if successful, render articles/index, and pass @articles


    ##############
    # selected_article_fields = {title: params[:title_like], body: params[:body_like], summary: params[:summary_like]}


    # filter(filtering_params)

    # @selected_data.filter(filtering_params(params))



    # params
    # params[:title]
    # search_articles_params.slice(:title)
    # params.slice(:title)

    # Jessica chastain
    # Pablo Picasso
    # sample_articles = Article.where(title: "Pablo Picasso")


    # sample_articles = Article.where(title: params[:title])
    # binding.pry

    # redirect_to articles_path
  end



  def filtering_params(params)
    params.slice(:title, :body, :summary)
  end




  def search_categories
  end

  def search_tags
  end

  def search_photos
  end

  def search_users
  end



end
