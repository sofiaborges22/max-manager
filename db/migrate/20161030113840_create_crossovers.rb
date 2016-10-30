class CreateCrossovers < ActiveRecord::Migration[5.0]
  def change
    create_table :crossovers do |t|
      t.string :title
      t.float :units
      t.float :fixed_cost
      t.float :variable_cost
      t.references :problem, foreign_key: true

      t.timestamps
    end
  end
end
