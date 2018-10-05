Rails.logger.debug("MASUK JSON NIE")
json.extract! expense, :id, :expense_date, :description, :expense_type, :expense_value, :file
json.price expense.price
json.file expense.file_identifier
#json.url expense_url(expense, format: :json)
