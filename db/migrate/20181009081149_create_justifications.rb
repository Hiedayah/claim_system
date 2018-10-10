class CreateJustifications < ActiveRecord::Migration[5.2]
  def change
    create_table :justifications do |t|
      t.string :approver_message
      t.string :verifier_message
      t.string :staff_message
      t.integer :claim_id
      t.timestamps
    end
  end
end
