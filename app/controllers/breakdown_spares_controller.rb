class BreakdownSparesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_breakdown_spare, only: [:show, :edit, :update, :destroy]

  # GET /breakdown_spares
  def index
    if params[:mr_id]
      @breakdown_spares = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_1 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_1.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_2 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_2.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_3 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_3.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_4 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_4.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_5 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_5.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_6 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_6.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_7 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_7.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_8 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_8.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_2_or_8 = policy_scope(BreakdownSpare.where(matrial_request_id: params[:mr_id]).by_spare_status_2_or_8.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
      redirect_to matrial_requests_path, alert: 'Please Select Material request first.'
    end
  end

  def pr_index
    if params[:pr_id]
      @breakdown_spares = policy_scope(BreakdownSpare.where(purchase_request_id: params[:pr_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_4 = policy_scope(BreakdownSpare.where(purchase_request_id: params[:pr_id]).by_spare_status_4.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_5 = policy_scope(BreakdownSpare.where(purchase_request_id: params[:pr_id]).by_spare_status_5.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      # status_8 for receivedbystore
      @breakdown_spares_by_spare_status_8 = policy_scope(BreakdownSpare.where(purchase_request_id: params[:pr_id]).by_spare_status_8.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
      @breakdown_spares_by_spare_status_7 = policy_scope(BreakdownSpare.where(purchase_request_id: params[:pr_id]).by_spare_status_7.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
      redirect_to matrial_requests_path, alert: 'Please Select Purchase request first.'
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "PR", layout: "pdf/pdf_layout", orientation: 'Landscape', header: { right: '[page] of [topage]' }
      end
    end

  end

  # GET /breakdown_spares/1
  def show
  end

  # GET /breakdown_spares/new
  def new
    @breakdown_spare = BreakdownSpare.new
  end

  # GET /breakdown_spares/1/edit
  def edit
  end

  # POST /breakdown_spares
  def create
    @breakdown_spare = BreakdownSpare.new(breakdown_spare_params)

    if @breakdown_spare.save
      redirect_to @breakdown_spare, notice: 'Breakdown spare was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /breakdown_spares/1
  def update
    if @breakdown_spare.update(breakdown_spare_params)
      redirect_to @breakdown_spare, notice: 'Breakdown spare was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /breakdown_spares/1
  def destroy
    @breakdown_spare.destroy
    redirect_to breakdown_spares_url, notice: 'Breakdown spare was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breakdown_spare
      @breakdown_spare = BreakdownSpare.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def breakdown_spare_params
      params.require(:breakdown_spare).permit(:repair_breakdown_id, :matrial_request_id, :purchase_request_id, :spare_part_number, :spare_description, :spare_quantity, :available_spare_quantity, :approved_spare_quantity, :willpurchase_spare_quantity, :purchased_spare_quantity, :replacement_code, :spare_status, :refuse_reason)
    end
end
