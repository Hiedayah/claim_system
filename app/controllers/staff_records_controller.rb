class StaffRecordsController < ApplicationController
  before_action :get_staff, except: [:index]
  def index
    @staffs = Staff.all
    respond_with(@staffs)
  end

  def change_role
    if params[:admin] == "true"
      @staff.update_columns(admin: true)
    else 
      @staff.update_columns(admin: false, admin_view: false)
    end
    
    if current_staff.admin? && current_staff.admin_view?
      redirect_to(request.referrer || root_path)
    else
      redirect_to(root_path)
    end
  end

  private
    def get_staff
      @staff = Staff.find(params[:id])
    end
end
