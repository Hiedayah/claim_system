class ApplicationController < ActionController::Base
	protect_from_forgery
	before_action :authenticate_staff!

	include Responder
	include Pundit

	def pundit_user
		current_staff
	end

	def configure_permitted_parameters
	  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit(:name, :company, :bank_name, :bank_account)
	end
end
end 
