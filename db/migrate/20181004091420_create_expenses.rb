class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.date :expense_date
      t.string :description
      t.integer :expense_type
      t.string :file
      t.integer :claim_id

      t.timestamps
    end
  end
end
