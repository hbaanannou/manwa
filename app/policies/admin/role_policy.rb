class Admin::RolePolicy < ApplicationPolicy

	def index?
    user.role?(:users_admin)
  end

  def show?
    user.role?(:users_admin)
  end

  def create?
    user.role?(:users_admin)
  end

  def update?
    user.role?(:users_admin)
  end

  def destroy?
    user.role?(:users_admin)
  end
  


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:users_admin)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end



  