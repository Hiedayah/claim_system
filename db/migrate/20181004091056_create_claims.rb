class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.date :date
      t.integer :verifier_id
      t.integer :approver_id
      t.integer :staff_id
      t.string :aasm_state

      t.timestamps
    end
  end
end
