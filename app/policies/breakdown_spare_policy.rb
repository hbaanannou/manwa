class BreakdownSparePolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:workshops_site) || user.role?(:rstore) || user.role?(:tstore)
  end

  def pr_index?
    user.role?(:workshops_manager) || user.role?(:purchase)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:rstore) || user.role?(:tstore)
  end

  def create?
    user.role?(:workshops_manager) || user.role?(:workshops_site)
  end

  def update?
    user.role?(:workshops_manager) || user.role?(:workshops_site) || user.role?(:rstore) || user.role?(:tstore)
  end

  def destroy?
    user.role?(:workshops_manager)
  end
  


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:workshops_manager) || user.role?(:purchase)
        scope.all
      elsif user.role?(:workshops_site)
        scope.joins(:matrial_request).where("matrial_requests.user_id =?", user)
      elsif user.role?(:rstore)
        scope.by_riyadh
      elsif user.role?(:tstore)
        scope.by_tabuk
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end