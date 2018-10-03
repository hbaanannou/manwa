class RepairOrderPolicy < ApplicationPolicy


	def index?
    user.role?(:workshops_manager) || user.role?(:workshops_site) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def show?
    user.role?(:workshops_manager) || user.role?(:workshops_site) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def create?
    user.role?(:workshops_manager) || user.role?(:workshops_site)
  end

  def update?
    user.role?(:workshops_manager) || user.role?(:workshops_site) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def destroy?
    user.role?(:workshops_manager) || user.role?(:workshops_site)
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
      elsif user.role?(:workshops_site)
        scope.where("repair_orders.workshop_site_user_id =?", user)
      elsif user.role?(:assets_province)
        scope.where("repair_orders.province_user_id =?", user)
      elsif user.role?(:assets_site)
        scope.where("repair_orders.site_user_id =?", user)
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end