class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    logged_in?

  	@categories = Category.all
  	@article_id = rand(Article.all.count)
  	if @article_id == 0
  		@article_id += 1
  	end
  	@article = Article.find_by(id: @article_id)

  end

end
