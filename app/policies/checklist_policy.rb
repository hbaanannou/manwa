class ChecklistPolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:rchecklist) || user.role?(:tchecklist)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:rchecklist) || user.role?(:tchecklist)
  end

  def create?
    user.role?(:workshops_manager) || user.role?(:rchecklist) || user.role?(:tchecklist)
  end

  def update?
    user.role?(:workshops_manager) || user.role?(:rchecklist) || user.role?(:tchecklist)
  end

  def destroy?
    user.role?(:workshops_manager) || user.role?(:rchecklist) || user.role?(:tchecklist)
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
      elsif user.role?(:rchecklist)
        scope.by_riyadh
      elsif user.role?(:tchecklist)
        scope.by_tabuk
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end