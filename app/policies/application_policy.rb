class ApplicationPolicy < ActionPolicy::Base

  #pre_check :allow_admins
  authorize :controller_name
  authorize :user

  def index?
    true
    Rails.logger.debug("CONTROLLER ====>#{@controller_name}")

  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
  
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def include_users(allow_user_methods)
    enable_users = allow_user_methods.map{|method| record.send(method)}
  end

  def allow_admins
    
  end

 
end
