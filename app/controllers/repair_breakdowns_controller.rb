class RepairBreakdownsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_repair_breakdown, only: [:show, :edit, :update, :destroy]

  # GET /repair_breakdowns
  def index
    if params[:ro_id]
      @repair_breakdowns = RepairBreakdown.where(repair_order_id: params[:ro_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
    else
      redirect_to repair_orders_url, alert: 'Please Select Repair Order first.'
    end
  end

  # GET /repair_breakdowns/1
  def show
  end

  # GET /repair_breakdowns/new
  def new
    @repair_breakdown = RepairBreakdown.new

    @repair_breakdown.breakdown_spares.build
  end

  # GET /repair_breakdowns/1/edit
  def edit
    @repair_breakdown.breakdown_spares.build
  end

  # POST /repair_breakdowns
  def create
    @repair_breakdown = RepairBreakdown.new(repair_breakdown_params)

    if @repair_breakdown.save
      redirect_to @repair_breakdown, notice: 'Repair breakdown was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /repair_breakdowns/1
  def update
    if @repair_breakdown.update(repair_breakdown_params)
      redirect_to repair_breakdowns_url(ro_id: params[:ro_id]), notice: 'Repair breakdown was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /repair_breakdowns/1
  def destroy
    @repair_breakdown.destroy
    redirect_to repair_breakdowns_url, notice: 'Repair breakdown was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_breakdown
      @repair_breakdown = RepairBreakdown.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def repair_breakdown_params
      params.require(:repair_breakdown).permit(:repair_order_id, :repair_breakdown_name, :breakdown_status, :repair_breakdown_description, :repair_breakdown_test_date, :repair_breakdown_technician_name, :repair_breakdown_test_result, :employee_id, :repair_breakdown_after_repair_test_date, :repair_breakdown_after_repair_remarks, breakdown_spares_attributes: BreakdownSpare.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
