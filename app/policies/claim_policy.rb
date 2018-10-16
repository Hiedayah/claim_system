class ClaimPolicy < ApplicationPolicy
	{
		submit: [:staff],
		verify: [:verifier],
		return_by_verifier: [:verifier],
		approve: [:approver],
		return_by_approver: [:approver]
	}.each do |action, allow_user_methods|
		define_method "#{action}?" do
			Rails.logger.debug("POLICY======>#{action}#{allow_user_methods}")
			enables_states = Claim.from_states_of_event(action) 
			enable_users = include_users(allow_user_methods)
			state_permission = enables_states.include?(record.aasm.current_state)
			user_permission = enable_users.include?(user)

			state_permission && user_permission
		end
	end

end

