class HomeController < ApplicationController
  def index
  	@categories = Category.all
  	@article = Article.find_by(id: rand(Article.all.count))
  end

end
