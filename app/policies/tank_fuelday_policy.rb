class TankFueldayPolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:rfuel) || user.role?(:tfuel)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:rfuel) || user.role?(:tfuel)
  end

  def create?
    user.role?(:workshops_manager) || user.role?(:rfuel) || user.role?(:tfuel)
  end

  def update?
    user.role?(:workshops_manager) || user.role?(:rfuel) || user.role?(:tfuel)
  end

  def destroy?
    user.role?(:workshops_manager) || user.role?(:rfuel) || user.role?(:tfuel)
  end
  


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:workshops_manager)
        scope.all
      elsif user.role?(:rfuel)
        scope.by_riyadh
      elsif user.role?(:tfuel)
        scope.by_tabuk
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end