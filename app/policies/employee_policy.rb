class EmployeePolicy < ApplicationPolicy


	def index?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
  end

  def show?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
  end

  def create?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
  end

  def update?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
  end

  def emp_charts?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
  end

  def destroy?
    user.role?(:assets_admin)
  end
  


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:assets_admin)
        scope.all
      elsif user.role?(:assets_manager)
        scope.all
      elsif user.role?(:workshops_manager)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end