class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    logged_in?

  end

  def donate
  end
end
