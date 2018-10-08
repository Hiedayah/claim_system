class Claim < ApplicationRecord
	include AASM
	belongs_to :staff
	belongs_to :verifier, class_name: "Staff", foreign_key: :verifier_id
	belongs_to :approver, class_name: "Staff", foreign_key: :approver_id

	has_many :expenses, dependent: :destroy

	aasm do
	    state :draft, :initial => true
	   	state :submitted
	    state :verified
	    state :approved

	    event :submit do
	      transitions :from => :draft, :to => :submitted
	    end

	    event :verify do
	      transitions :from => :submitted, :to => :verified
	      
	    end

	    event :approve do
	      transitions :from => :verified, :to => :approved
	    end
  

	end

end
