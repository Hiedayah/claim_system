class StaffPolicy < ApplicationPolicy

  def index?
    user.admin? && user.admin_view? 
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    index?
  end

end