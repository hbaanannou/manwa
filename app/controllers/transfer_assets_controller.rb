class TransferAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transfer_asset, only: [:show, :edit, :update, :destroy]

  # GET /transfer_assets
  def index
    @q = TransferAsset.includes(:user, :data_asset, :site_asset_from, :site_asset_to).ransack(params[:q])
    @transfer_assets = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))

    @transfer_assets_pdf = policy_scope(@q.result.order(created_at: :desc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "transfer_assets", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  # GET /transfer_assets/1
  def show
    authorize @transfer_asset

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Transfer_Request", layout: "pdf/pdf_layout_show"
      end
    end

  end

  # GET /transfer_assets/new
  def new
    @transfer_asset = TransferAsset.new
    authorize @transfer_asset

    if params[:asset_id] && !params[:asset_id].blank?
    @data_asset = DataAsset.find(params[:asset_id])
    end
  end

  # GET /transfer_assets/1/edit
  def edit
    @data_asset = DataAsset.find(params[:asset_id])
    authorize @transfer_asset
  end

  # POST /transfer_assets
  def create

    # @data_asset here comes from hidden field in form to send the params to create action which render :new action with @data_asset to use it again wuth error message
    @data_asset = DataAsset.find(params[:asset_id])

    @transfer_asset = TransferAsset.new(transfer_asset_params_for_create_action)

    if current_user.role?(:assets_province)
      @transfer_asset.user_type = params[:user_type]
    end

    @transfer_asset.user_id = current_user.id

    @transfer_asset.delivery_site_user_id = @data_asset.site_asset.user_id
    @transfer_asset.receive_site_user_id = SiteAsset.find(params[:transfer_asset][:site_asset_to_id]).user_id

    @transfer_asset.province_asset_from_id = params[:province_asset_from_id]

    @transfer_asset.delivery_province_user_id = @data_asset.province_asset.user_id
    @transfer_asset.receive_province_user_id = ProvinceAsset.find(params[:transfer_asset][:province_asset_to_id]).user_id

    authorize @transfer_asset

    if @transfer_asset.save
      redirect_to root_path, notice: 'Transfer asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transfer_assets/1
  def update

    # @data_asset here comes from hidden field in form to send the params to create action which render :new action with @data_asset to use it again wuth error message
    @data_asset = DataAsset.find(params[:asset_id])

    if current_user.role?(:assets_manager)
      @transfer_asset.transfer_dep_user_id = current_user.id
      @transfer_asset.transfer_dep_action_date = DateTime.now
    end

    if current_user.role?(:assets_site) && @transfer_asset.accepted? && (current_user.id == @transfer_asset.delivery_site_user_id)
      @transfer_asset.delivery_site_user_id = current_user.id
      @transfer_asset.delivery_site_action_date = DateTime.now
      @transfer_asset.transfer_status = :posted
    end

    if current_user.role?(:assets_site) && @transfer_asset.posted? && (current_user.id == @transfer_asset.receive_site_user_id)
      @transfer_asset.receive_site_user_id = current_user.id
      @transfer_asset.receive_site_action_date = DateTime.now
      @transfer_asset.transfer_status = :received
    end

    authorize @transfer_asset

    if @transfer_asset.update(transfer_asset_params)
      redirect_to root_path, notice: 'Transfer asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transfer_assets/1
  def destroy
    authorize @transfer_asset
    @transfer_asset.destroy
    redirect_to transfer_assets_url, notice: 'Transfer asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer_asset
      @transfer_asset = TransferAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transfer_asset_params

      transfer_asset_here_only = TransferAsset.find(params[:id])

      if current_user.role?(:assets_manager)
        params.require(:transfer_asset).permit(:transfer_status, :refuse_reason, :transfer_dep_user_id, :transfer_dep_action_date, :transfer_date, :data_asset_lowbed_id)
      elsif current_user.role?(:assets_site) && transfer_asset_here_only.accepted? && current_user.id == transfer_asset_here_only.delivery_site_user_id
        params.require(:transfer_asset).permit(:delivery_done, :transfer_status, :delivery_site_user_id, :delivery_site_action_date, :delivery_transfer_driver_form, :delivery_repair_order,
         :delivery_accident_report, :delivery_maintenance_card, :delivery_car_license, :delivery_operation_card)
      elsif current_user.role?(:assets_site) && transfer_asset_here_only.posted? && current_user.id == transfer_asset_here_only.receive_site_user_id
        params.require(:transfer_asset).permit(:receive_done, :transfer_status, :receive_site_user_id, :receive_site_action_date, :receive_transfer_driver_form, :receive_repair_order,
         :receive_accident_report, :receive_maintenance_card, :receive_car_license, :receive_operation_card)
      end

    end

    # Only allow a trusted parameter "white list" through.
    def transfer_asset_params_for_create_action
      params.require(:transfer_asset).permit(:data_asset_id, :user_id, :user_type, :transfer_reason, :site_asset_from_id, :province_asset_from_id, :delivery_site_user_id, :delivery_province_user_id,
       :site_asset_to_id, :province_asset_to_id, :receive_site_user_id, :receive_province_user_id, :transfer_status)
    end
end
