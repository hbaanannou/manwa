class RepairOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_repair_order, only: [:show, :edit, :update, :destroy]

  # GET /repair_orders
  def index
    

    if params[:workshop_id].blank?
      @repair_orders = policy_scope(RepairOrder.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @requested_repair_orders = policy_scope(RepairOrder.by_requested.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @received_repair_orders = policy_scope(RepairOrder.by_received.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @opened_repair_orders = policy_scope(RepairOrder.by_opened.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @hold_repair_orders = policy_scope(RepairOrder.by_hold.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @repaired_repair_orders = policy_scope(RepairOrder.by_repaired.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @returned_repair_orders = policy_scope(RepairOrder.by_returned.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
      @repair_orders = policy_scope(RepairOrder.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @requested_repair_orders = policy_scope(RepairOrder.by_requested.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @received_repair_orders = policy_scope(RepairOrder.by_received.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @opened_repair_orders = policy_scope(RepairOrder.by_opened.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @hold_repair_orders = policy_scope(RepairOrder.by_hold.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @repaired_repair_orders = policy_scope(RepairOrder.by_repaired.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @returned_repair_orders = policy_scope(RepairOrder.by_returned.by_workshop_site(params[:workshop_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    end
  end

  # GET /repair_orders/1
  def show
    authorize @repair_order

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Repair_Order", layout: "pdf/pdf_layout_show"
      end
    end
  end

  # GET /repair_orders/new
  def new
    @repair_order = RepairOrder.new
    3.times do
      @repair_order.repair_breakdowns.build
    end

    if params[:asset_id] && !params[:asset_id].blank?
    @data_asset = DataAsset.find(params[:asset_id])
    end
  end

  # GET /repair_orders/1/edit
  def edit
    @data_asset = DataAsset.find(params[:asset_id])
  end

  # POST /repair_orders
  def create
    @data_asset = DataAsset.find(params[:asset_id])

    @repair_order = RepairOrder.new(repair_order_params)

    @repair_order.user_id = current_user.id

    @repair_order.site_user_id = SiteAsset.find(params[:repair_order][:site_asset_id]).user_id
    @repair_order.province_user_id = ProvinceAsset.find(params[:province_asset_id]).user_id

    @repair_order.workshop_site_user_id = SiteAsset.find(params[:repair_order][:workshop_site_id]).user_id

    if @repair_order.save
      redirect_to :root, notice: 'Repair order was successfully created.'
    else
      @repair_order.repair_breakdowns.build
      render :new
    end
  end

  # PATCH/PUT /repair_orders/1
  def update
    @data_asset = DataAsset.find(params[:asset_id])

    if current_user.role?(:workshops_site) && params[:repair_order][:delivery_done] == "1"
      @repair_order.workshop_site_user_id = current_user.id
      @repair_order.workshop_site_action_date = DateTime.now
      @repair_order.repair_status = :received
    end

    if current_user.role?(:workshops_site) && params[:repair_order][:workshop_site_repair_done] == "1"
      @repair_order.workshop_site_repair_date = DateTime.now
      params[:repair_order][:repair_status] = :repaired
    end

    if current_user.role?(:assets_site) && params[:repair_order][:return_done] == "1"
      @repair_order.return_site_action_date = DateTime.now
      @repair_order.repair_status = :returned
    end


    if @repair_order.update(repair_order_params)
      redirect_to :root, notice: 'Repair order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /repair_orders/1
  def destroy
    @repair_order.destroy
    redirect_to repair_orders_url, notice: 'Repair order was successfully destroyed.'
  end

  # by hany
  def create_matrial_request_with_old_spares
    
    current_repair_order = RepairOrder.find(params[:ro_id])
    current_repair_order.repair_breakdowns.each_with_index do |breakdown, index|

        workshop_area_id = SiteAsset.find(current_repair_order.workshop_site_id).province_asset.area_asset_id

        if index == 0
          @matrial_request = MatrialRequest.create(repair_order_id: params[:ro_id], area_asset_id: workshop_area_id, user_id: current_user.id)
        end

        breakdown.breakdown_spares.where(spare_status: :newspare).each do |spare|
          spare.matrial_request_id = @matrial_request.id
          spare.spare_status = 'requested'
          spare.save
        end

    end

    if @matrial_request
      redirect_to breakdown_spares_path(mr_id: @matrial_request.id), notice: 'Repair order was successfully created.'
    else
      redirect_to repair_orders_path(anchor: 'repair_orders_index_tab_2'), alert: 'No new spares in breakes yet.'
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_order
      @repair_order = RepairOrder.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def repair_order_params
      params.require(:repair_order).permit(:data_asset_id, :user_id, :site_asset_id, :employee_id, :transfer_date, :transfer_time, :workshop_site_id, :workshop_site_user_id,
       :workshop_site_action_date, :workshop_ignition_switch, :workshop_equipment_card, :workshop_driver_card, :workshop_maintenance_card, :delivery_done, 
       :workshop_site_repair_note, :workshop_site_repair_date, :workshop_site_repair_done,
       :return_site_action_date, :return_ignition_switch, :return_equipment_card, :return_driver_card, :return_maintenance_card, :return_done, :repair_status,
        repair_breakdowns_attributes: RepairBreakdown.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
