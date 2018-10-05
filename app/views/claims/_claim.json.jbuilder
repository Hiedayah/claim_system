json.extract! claim, :id, :date, :status, :verifier_id, :approver_id, :staff_id, :aasm_state, :created_at, :updated_at
json.url claim_url(claim, format: :json)
