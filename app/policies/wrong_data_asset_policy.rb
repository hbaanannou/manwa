class WrongDataAssetPolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:assets_admin)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:assets_admin)
  end

  def create?
    user.role?(:workshops_manager) || user.role?(:assets_admin)
  end

  def update?
    user.role?(:workshops_manager) || user.role?(:assets_admin)
  end

  def destroy?
    user.role?(:workshops_manager) || user.role?(:assets_admin)
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
      elsif user.role?(:assets_admin)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end