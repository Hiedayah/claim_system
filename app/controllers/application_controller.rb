class ApplicationController < ActionController::Base
	protect_from_forgery
	before_action :authenticate_staff!

	include Responder
	include Pundit

	def pundit_user
		current_staff
	end
end 
