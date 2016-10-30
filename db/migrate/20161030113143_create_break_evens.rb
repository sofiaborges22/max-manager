class CreateBreakEvens < ActiveRecord::Migration[5.0]
  def change
    create_table :break_evens do |t|
      t.string :title
      t.float :fixed_cost
      t.float :selling_price
      t.float :variable_cost
      t.references :problem

      t.timestamps
    end
  end
end
