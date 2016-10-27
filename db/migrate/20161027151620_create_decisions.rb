class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.string :title
      t.float :associated_cost
      t.integer :favorable_probability
      t.float :unfavorable_probability
      t.float :favorable_result
      t.float :unfavorable_result
      t.references :problem, foreign_key: true

      t.timestamps
    end
  end
end
