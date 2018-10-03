class DataAssetPolicy < ApplicationPolicy

	def index?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site) || user.role?(:workshops_manager) || user.role?(:workshops_site)
  end

  def show?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:assets_province) || user.role?(:assets_site) || user.role?(:workshops_manager) || user.role?(:workshops_site)
  end

  def create?
    user.role?(:assets_admin)
  end

  def update?
    user.role?(:assets_admin) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def charts?
    user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager) || user.role?(:assets_province) || user.role?(:assets_site)
  end

  def destroy?
    user.role?(:assets_admin)
  end



  def permitted_attributes
    if user.role?(:assets_admin) || user.role?(:assets_manager)
      [:data_asset_serial, :type_asset_id, :model_asset_id, :data_asset_serial, :data_asset_plate, :color_asset_id, :data_asset_manufacture_year, :data_asset_engine, :data_asset_power, :status_asset_id, :site_asset_id, :employee_asset_id, :data_asset_current_condition, :data_asset_remarks, :data_asset_in_use, :user_id, images: [], images_attachments_attributes: [:id, :_destroy]]
    elsif user.role?(:assets_province) || user.role?(:assets_site)
      [:status_asset_id, :data_asset_in_use, :data_asset_current_condition, :data_asset_remarks]
    end
  end



  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:assets_admin) || user.role?(:assets_manager) || user.role?(:workshops_manager)
        scope.all
      elsif user.role?(:assets_province)
        scope.joins(:province_asset).where("province_assets.user_id =?", user)
      elsif user.role?(:assets_site)
        scope.joins(:site_asset).where("site_assets.user_id =?", user)
      elsif user.role?(:workshops_site)
        scope.joins(:site_asset).where("site_assets.user_id =?", user)
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end