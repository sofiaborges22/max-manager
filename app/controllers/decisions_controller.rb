class DecisionsController < ApplicationController
	def index
		@problem = Problem.find_by(id: params[:problem_id])
		@decisions = @problem.decisions.all
	end

	def show
		@problem = Problem.find_by(id: params[:problem_id])
		@decisions = Decision.where(problem_id: params[:problem_id])
		
		@max = 0
		@decision_name = ""

		@decisions.each do |decision|
			fav_prob = ((decision.favorable_probability.to_f)/100)
			unfav_prob = ((decision.unfavorable_probability.to_f)/100)
			@favorable = (fav_prob)*(decision.favorable_result.to_f)
			@unfavorable = (unfav_prob)*(decision.unfavorable_result.to_f)
			@totalEV = @favorable + @unfavorable
			@net_gain = @totalEV - decision.associated_cost.to_f

			if @max < @net_gain
				@max = @net_gain
				@decision_name = decision.title
			end
		end

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ResultDecisionPdf.new(@problem, @decisions, @decision_name, @max, view_context)
				send_data pdf.render, filename: "problem_#{@problem.title}.pdf",
				                      type: "application/pdf",
				                      disposition: "inline"
			end
		end
	end

	def new
		@problem = Problem.find_by(id: params[:problem_id])
		@new_decision = Decision.new
	end

	def create
		@problem = current_user.problems.find_by(id: params[:problem_id])
		@decision = @problem.decisions.new(decision_params)
		if @decision.save
			redirect_to problem_decisions_path(@problem)
		else
			render text => "Decision not saved"
		end
	end

	def destroy
		@problem = Problem.find_by(id: params[:problem_id])
		@decisions = Decision.find_by("id")
		@decisions.destroy
		redirect_to :back
	end

	




	private
	def decision_params 
		params.require(:decision).permit(:title, :associated_cost, :favorable_probability, :unfavorable_probability, :favorable_result, :unfavorable_result)
	end
end
