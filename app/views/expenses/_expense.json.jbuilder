json.extract! expense, :id, :expense_date, :description, :expense_type, :file, :claim_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
