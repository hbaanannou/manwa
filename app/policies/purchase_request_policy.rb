class PurchaseRequestPolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:rstore) || user.role?(:tstore) || user.role?(:purchase)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:rstore) || user.role?(:tstore)
  end

  def create?
    user.role?(:workshops_manager)
  end

  def update?
    user.role?(:purchase)
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
      if user.role?(:workshops_manager)
        scope.all
      elsif user.role?(:purchase)
        scope.where(request_purchase_done: true)
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