Rails.logger.debug("MASUK JSON NIE")
json.extract! expense, :id, :expense_date, :description, :expense_type, :expense_value, :file
json.expense_type expense.expense_type.humanize
json.price expense.price
json.file file_link(expense)
if current_staff.id == expense.claim.staff_id && policy(expense.claim).submit?
json.url "#{url_button(edit: {url: edit_expense_path(id: expense.id)},
                    destroy: {url: expense_path(id: expense.id)})}"
else
json.url ""
end

#json.url expense_url(expense, format: :json)
