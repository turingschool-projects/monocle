class FavoritesController < ApplicationController

  def index
    @starred_companies = current_user.companies.order(name: :asc)
    @starred_jobs = current_user.starred_jobs
  end

end
