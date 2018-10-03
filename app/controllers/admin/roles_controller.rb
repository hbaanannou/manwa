module Admin
class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Admin::Role.order(id: :asc).paginate(:page => params[:page], :per_page => 20)
    authorize @roles
  end

  # GET /roles/1
  def show
  end

  # GET /roles/new
  def new
    @role = Admin::Role.new
    authorize @role
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Admin::Role.new(role_params)

    if @role.save
      redirect_to @role, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    authorize @role

    if @role.update(role_params)
      redirect_to @role, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    authorize @role
    
    @role.destroy
    redirect_to admin_roles_url, notice: 'Role was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Admin::Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:admin_role).permit(:role_name, :role_remarks)
    end
end
end