module ErrorHandler
  extend ActiveSupport::Concern


  included do
    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized
  end

  private

  def user_not_authorized(exception)
    status_code = "unauthorized"
    message = "You are not authorized to perform this action."
    #redirect_to(request.referrer || root_path)
    respond_to do |format|
      format.html {redirect_to(root_path, alert: message)}
      format.json {render json: { error: { status: status_code, message: message } }, status: 403}
      format.js {render js: "$.snackbar({content: '#{message}'}); 
                             console.log('#{message}')
                            "}
    end
  end
end