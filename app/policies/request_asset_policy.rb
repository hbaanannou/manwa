class RequestAssetPolicy < ApplicationPolicy


	def index?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def accepted?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def show?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def create?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site)
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
        scope.where("request_assets.province_user_id =?", user)
      elsif user.role?(:assets_site)
        scope.where("request_assets.site_user_id =?", user)
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end