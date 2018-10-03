class RequestAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request_asset, only: [:show, :edit, :update, :destroy]

  # GET /request_assets
  def index

    @q = RequestAsset.includes(:user, :site_asset_to).ransack(params[:q])
    @request_assets = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))

    @request_assets_pdf = policy_scope(@q.result.order(created_at: :desc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "request_assets", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end

  end


  def accepted
    @request_assets = RequestAsset.by_rent_by_us_and_we_have.order(:available_date).paginate(:page => params[:page], :per_page => 20)
    @rent_by_us_request_assets = RequestAsset.by_rent_by_us.order(:available_date).paginate(:page => params[:page], :per_page => 20)
    @we_have_request_assets = RequestAsset.by_we_have.order(:available_date).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /request_assets/1
  def show
    authorize @request_asset

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Asset_Request", layout: "pdf/pdf_layout_show"
      end
    end
  end

  # GET /request_assets/new
  def new
    @request_asset = RequestAsset.new
  end

  # GET /request_assets/1/edit
  def edit
  end

  # POST /request_assets
  def create
    @request_asset = RequestAsset.new(request_asset_params)

    @request_asset.user_id = current_user.id
    @request_asset.site_user_id = SiteAsset.find(params[:request_asset][:site_asset_to_id]).user_id
    @request_asset.province_user_id = ProvinceAsset.find(params[:province_asset_to_id]).user_id

    @request_asset.province_asset_to_id = params[:province_asset_to_id]

    if current_user.role?(:assets_province)
      @request_asset.user_type = params[:user_type]
      @request_asset.province_user_id = current_user.id
      @request_asset.province_user_action_date = DateTime.now
      @request_asset.request_status = :pass
    end


    if @request_asset.save
      redirect_to @request_asset, notice: 'Request asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /request_assets/1
  def update
    # if current user is province and request creator is site
    if current_user.role?(:assets_province) && @request_asset.sitemanager?
      @request_asset.province_user_id = current_user.id
      @request_asset.province_user_action_date = DateTime.now
    end

    if current_user.role?(:assets_manager)
      @request_asset.transfer_dep_user_id = current_user.id
      @request_asset.transfer_dep_action_date = DateTime.now

      if params[:request_asset][:available_after_days]
        @request_asset.available_date = Date.today + params[:request_asset][:available_after_days].to_i
      else
        @request_asset.available_date = Date.today
      end

    end


    if current_user.role?(:assets_manager) && @request_asset.accepted?
      @request_asset.ready_dep_action_date = DateTime.now
      @request_asset.request_status = :ready
    end


    if current_user.role?(:assets_site) && @request_asset.ready? && (current_user.id == @request_asset.site_user_id)
      @request_asset.receive_site_action_date = DateTime.now
      @request_asset.request_status = :received
    end



    if @request_asset.update(request_asset_params)
      redirect_to @request_asset, notice: 'Request asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /request_assets/1
  def destroy
    @request_asset.destroy
    redirect_to request_assets_url, notice: 'Request asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_asset
      @request_asset = RequestAsset.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def request_asset_params
      params.require(:request_asset).permit(:user_id, :user_type, :type_asset_id, :province_asset_to_id, :site_asset_to_id, :driver_request,
       :request_reason, :work_type, :request_status, :site_user_id, :province_user_id, :area_user_action_date,
       :transfer_dep_user_id, :transfer_dep_action_date, :refuse_reason, :need_date, :need_days, :accept_status, :available_after_days, :available_date, 
       :ready_done, :ready_dep_action_date, :ready_date, :data_asset_if_ours_id, :data_asset_lowbed_id, 
       :receive_done, :receive_site_action_date, :receive_transfer_driver_form, 
       :receive_repair_order, :receive_accident_report, :receive_maintenance_card, :receive_car_license, :receive_operation_card)
    end
end
