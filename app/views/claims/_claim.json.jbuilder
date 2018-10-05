json.extract! claim, :id, :date, :aasm_state, :staff_id
json.staff_id claim.staff.name
#json.url claim_url(claim, format: :json)
