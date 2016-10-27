class SiteController < ApplicationController
  def index
  end

  def show
  	@user = current_user
  	@new_problem = Problem.new
  end

end
