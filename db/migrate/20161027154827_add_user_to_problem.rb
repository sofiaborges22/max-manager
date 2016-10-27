class AddUserToProblem < ActiveRecord::Migration[5.0]
	def change
		add_reference :problems, :user, index: true
	end
end
