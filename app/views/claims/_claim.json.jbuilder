json.extract! claim, :id, :date, :aasm_state, :staff_id
json.date claim.date.strftime("%d/%m/%Y")
json.aasm_state claim.aasm_state.humanize
json.staff_id claim.staff.name
json.url "#{url_button(show: {url: claim_path(id: claim.id)},
					edit: {url: edit_claim_path(id: claim.id)},
					destroy: {url: claim_path(id: claim.id)})}"
#json.url claim_url(claim, format: :json)
