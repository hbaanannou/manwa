class WithdrawAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_withdraw_asset, only: [:show, :edit, :update, :destroy]

  # GET /withdraw_assets
  def index
    @q = WithdrawAsset.includes(:user, :data_asset, :site_asset_from, :site_asset_to).ransack(params[:q])
    @withdraw_assets = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))

    @withdraw_assets_pdf = policy_scope(@q.result.order(created_at: :desc))
    
    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "withdraw_assets", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  # GET /withdraw_assets/1
  def show
    authorize @withdraw_asset

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Withdraw_Request", layout: "pdf/pdf_layout_show"
      end
    end
  end

  # GET /withdraw_assets/new
  def new
    @withdraw_asset = WithdrawAsset.new
    authorize @withdraw_asset

    if params[:asset_id] && !params[:asset_id].blank?
    @data_asset = DataAsset.find(params[:asset_id])
    end
  end

  # GET /withdraw_assets/1/edit
  def edit
    @data_asset = DataAsset.find(params[:asset_id])
    authorize @withdraw_asset
  end

  # POST /withdraw_assets
  def create

    # @data_asset here comes from hidden field in form to send the params to create action which render :new action with @data_asset to use it again wuth error message
    @data_asset = DataAsset.find(params[:asset_id])

    @withdraw_asset = WithdrawAsset.new(withdraw_asset_params)

    @withdraw_asset.user_id = current_user.id

    @withdraw_asset.delivery_site_user_id = @data_asset.site_asset.user_id
    @withdraw_asset.receive_site_user_id = SiteAsset.find(params[:withdraw_asset][:site_asset_to_id]).user_id

    @withdraw_asset.province_asset_from_id = params[:province_asset_from_id]

    @withdraw_asset.delivery_province_user_id = @data_asset.province_asset.user_id
    @withdraw_asset.receive_province_user_id = ProvinceAsset.find(params[:withdraw_asset][:province_asset_to_id]).user_id

    authorize @withdraw_asset


    if @withdraw_asset.save
      redirect_to @withdraw_asset, notice: 'Withdraw asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /withdraw_assets/1
  def update

    # @data_asset here comes from hidden field in form to send the params to create action which render :new action with @data_asset to use it again wuth error message
    @data_asset = DataAsset.find(params[:asset_id])

    if current_user.role?(:assets_site) && @withdraw_asset.opened? && (current_user.id == @withdraw_asset.delivery_site_user_id)
      @withdraw_asset.delivery_site_user_id = current_user.id
      @withdraw_asset.delivery_site_action_date = DateTime.now
      @withdraw_asset.withdraw_status = :posted
    end

    if current_user.role?(:assets_site) && @withdraw_asset.posted? && (current_user.id == @withdraw_asset.receive_site_user_id)
      @withdraw_asset.receive_site_user_id = current_user.id
      @withdraw_asset.receive_site_action_date = DateTime.now
      @withdraw_asset.withdraw_status = :received
    end

    authorize @withdraw_asset

    if @withdraw_asset.update(withdraw_asset_params)
      redirect_to @withdraw_asset, notice: 'Withdraw asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /withdraw_assets/1
  def destroy
    @withdraw_asset.destroy
    redirect_to withdraw_assets_url, notice: 'Withdraw asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw_asset
      @withdraw_asset = WithdrawAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def withdraw_asset_params
      params.require(:withdraw_asset).permit(:data_asset_id, :user_id, :withdraw_reason, :withdraw_procedure, :site_asset_from_id, :province_asset_from_id, :site_asset_to_id, :province_asset_to_id, 
        :withdraw_status, :transfer_date, :data_asset_lowbed_id, 
        :delivery_site_user_id, :delivery_site_action_date, :delivery_province_user_id, :delivery_done, 
        :delivery_transfer_driver_form, :delivery_repair_order, :delivery_accident_report, :delivery_maintenance_card, :delivery_car_license, :delivery_operation_card,
        :receive_site_user_id, :receive_site_action_date, :receive_province_user_id, :receive_done,
        :receive_transfer_driver_form, :receive_repair_order, :receive_accident_report, :receive_maintenance_card, :receive_car_license, :receive_operation_card)
    end
end
