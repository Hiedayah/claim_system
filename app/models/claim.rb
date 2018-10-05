class Claim < ApplicationRecord
	belongs_to :staff
	belongs_to :verifier, class_name: "Staff", foreign_key: :verifier_id
	belongs_to :approver, class_name: "Staff", foreign_key: :approver_id

	has_many :expenses, dependent: :destroy

end
