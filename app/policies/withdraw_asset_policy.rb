class WithdrawAssetPolicy < ApplicationPolicy


	def index?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def show?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def create?
    user.role?(:assets_admin) || user.role?(:assets_manager)
  end


  def update?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def destroy?
    user.role?(:assets_admin) || user.role?(:assets_manager)
  end
  


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:assets_admin) || user.role?(:assets_manager)
        scope.all
      elsif user.role?(:assets_province)
        scope.where("((withdraw_assets.withdraw_status = 0 OR withdraw_assets.withdraw_status = 1 OR withdraw_assets.withdraw_status = 2) AND withdraw_assets.delivery_province_user_id =?) OR withdraw_assets.receive_province_user_id =?", user, user)
      elsif user.role?(:assets_site)
        scope.where("((withdraw_assets.withdraw_status = 0 OR withdraw_assets.withdraw_status = 1 OR withdraw_assets.withdraw_status = 2) AND withdraw_assets.delivery_site_user_id =?) OR withdraw_assets.receive_site_user_id =?", user, user)
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end