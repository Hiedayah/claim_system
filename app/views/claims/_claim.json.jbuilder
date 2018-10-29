json.extract! claim, :id, :date, :aasm_state, :staff_id
json.date claim.created_at.strftime("%B %Y")
json.aasm_state claim.aasm_state.humanize
json.staff_id claim.staff.name
if current_staff.id == claim.staff_id && allowed_to?(:submit?, claim) && !current_staff.admin_view?
json.url "#{url_button(show: {url: claim_path(id: claim.id)},
					edit: {url: edit_claim_path(id: claim.id)},
					destroy: {url: claim_path(id: claim.id)})}"
elsif (allowed_to?(:verify?, claim) || allowed_to?(:approve?, claim)) && current_staff.admin_view?
json.url link_to "Pending Approval", claim_path(claim), data:{remote: true, toggle: 'modal', target: '#modal'}
else
json.url "#{url_button(show: {url: claim_path(id: claim.id)})}"
end
json.total_claim claim.expenses.sum(&:price)
#json.url claim_url(claim, format: :json)