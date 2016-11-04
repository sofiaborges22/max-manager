class ProblemsController < ApplicationController
	def index
		problem = current_user.problems
		# problems = Problem.all
		render json: problem
	end

	def show
		@problem = Problem.find_by(id: params[:id])
	end

	def new
		@user = User.find_by(id: params[:id])
		@new_problem = Problem.new
	end

	def create
	    problem = current_user.problems.new(problem_params)
	    
	    if problem.save
	      redirect_to profile_path(current_user)
	    else 
	      render :text => "Problem could not be saved"
	    end
	end

	def destroy
		problem = Problem.find_by(id: params[:id])
		problem.destroy
		redirect_to profile_path(current_user)
	end

	def form_decision
		@user = User.find_by(id: params[:id])
		@problem = Problem.find_by(id: params[:id])
		@decision = @problem.decisions.all
	end

	private
	def problem_params #STRONG PARAMETERS: Grabs all the parameters for product that would normally go in the create action and inserts into this method, that simplifies the params code for a product
    	params.require(:problem).permit(:title, :description, :category)
    end
end
