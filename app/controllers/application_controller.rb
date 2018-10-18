# class ApplicationController < ActionController::Base
# 	include Responder
# 	include Pundit

# 	protect_from_forgery
# 	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

# 	before_action :authenticate_staff!
# 	before_action :handle_authorization, if: :staff_signed_in?


# 	def pundit_user
# 		current_staff
# 	end

# 	def configure_permitted_parameters
# 	  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
# 	   		 user_params.permit(:name, :company, :bank_name, :bank_account)
# 		end
#     end

	

	
# 	protected
# 		def handle_authorization
# 			#allow = true
# 			if !current_staff.admin? && (request.original_url =~ %r{/settings})
# 				!authorize(:application)
# 			else
# 				user_not_authorized(current_staff)
# 			end
# 	    end
# 	private
# 		def user_not_authorized(current_staff)
# 			flash[:alert] = "You are not allowed to view this page"
# 			# redirect_to(request.referrer || root_path)
# 		end
# 	#protected
		

# end 

class ApplicationController < ActionController::Base
	include Responder
	include Pundit

	protect_from_forgery
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :authenticate_staff!
	before_action :handle_authorization, if: :staff_signed_in?


	def pundit_user
		current_staff
	end


	def switch_to_admin
		current_staff.update_columns(admin: true)
		redirect_to root_path
	end

	def switch_to_normal_user
		current_staff.update_columns(admin: false)
		redirect_to root_path
	end

	protected
		def handle_authorization
			#allow = true
			if !current_staff.admin? && (request.original_url =~ %r{/settings})
				!authorize(:application)
			else
				#redirect_to root_path
			end
	    end
	    def configure_permitted_parameters
		  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company])
			devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company, :bank_account, :bank_name])
    	end

	private
		def user_not_authorized(current_staff)
		end
	#protected
		

end 