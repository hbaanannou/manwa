class ProConcreteSubPolicy < ApplicationPolicy

	def index?
    user.role?(:production_admin) || user.role?(:production_province)
  end

  def show?
    user.role?(:production_admin) || user.role?(:production_province)
  end

  def create?
    user.role?(:production_admin) || user.role?(:production_province)
  end

  def update?
    user.role?(:production_admin) || user.role?(:production_province)
  end

  def destroy?
    user.role?(:production_admin)
  end



  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:production_admin)
        scope.all
      elsif user.role?(:production_province)
        scope.joins(pro_concrete: :province_pro_asset).where("province_pro_assets.user_id =?", user)
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

end