class Claim < ApplicationRecord
	include AASM
	belongs_to :staff
	belongs_to :verifier, class_name: "Staff", foreign_key: :verifier_id
	belongs_to :approver, class_name: "Staff", foreign_key: :approver_id

	has_many :expenses, dependent: :destroy
	has_one :justification

	accepts_nested_attributes_for :justification, reject_if: :all_blank, allow_destroy: true

	aasm do
	    state :draft, :initial => true
	   	state :submitted
	    state :verified
	    state :returned_by_verifier
	    state :approved
	    state :returned_by_approver

	    event :submit do
	      transitions :from => [:draft, :returned_by_verifier, :returned_by_approver], :to => :submitted
	    end

	    event :verify do
	      transitions :from => :submitted, :to => :verified
	      
	    end

	    event :return_by_verifier do
	      transitions :from => :submitted, :to => :returned_by_verifier
	      
	    end

	    event :approve do
	      transitions :from => :verified, :to => :approved
	    end

	    event :return_by_approver do
	      transitions :from => :verified, :to => :returned_by_approver

	    end
  

	end

end
