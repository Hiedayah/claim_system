class AddExpenseValueToExpenses < ActiveRecord::Migration[5.2]
  def change
  	add_column :expenses, :expense_value, :float
  end
end
