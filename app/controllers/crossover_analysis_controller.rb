class CrossoverAnalysisController < ApplicationController
	def index
		@problem = Problem.find_by(id: params[:problem_id])
		@crossover = @problem.crossovers.all
	end

	def new
		@problem = Problem.find_by(id: params[:problem_id])
		@new_crossover = Crossover.new
	end

	def show 
		@problem = Problem.find_by(id: params[:problem_id])
		@crossover = @problem.crossovers.all
		@lowest_total_cost = @crossover.min_by do |crossover|
			@result_total_cost = (crossover.units * crossover.variable_cost)+crossover.fixed_cost
		end

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ResultCrossoverPdf.new(@problem, @crossover, @lowest_total_cost, @result_total_cost, view_context)
				send_data pdf.render, filename: "problem_#{@problem.title}.pdf",
				                      type: "application/pdf",
				                      disposition: "inline"
			end
		end
	end

	def create
		@problem = Problem.find_by(id: params[:problem_id])
		@crossover = @problem.crossovers.new(crossover_params)
		if @crossover.save
			redirect_to problem_crossover_analysis_index_path(@problem)
		else
			render text => "Crossover Analysis not saved"
		end
	end

	def destroy
		@problem = Problem.find_by(id: params[:problem_id])
		@crossover = Crossover.find_by("id")
		@crossover.destroy
		redirect_to :back
	end

	private
	def crossover_params
		params.require(:crossover).permit(:title, :units, :fixed_cost, :variable_cost, :user_id)
	end
end
