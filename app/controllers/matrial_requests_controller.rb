class MatrialRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_matrial_request, only: [:show, :edit, :update, :destroy]

  # GET /matrial_requests
  # GET /matrial_requests.json
  def index
    @q = MatrialRequest.ransack(params[:q])
    @matrial_requests = policy_scope(@q.result.order(id: :desc).paginate(:page => params[:page], :per_page => 20))
  end

  # GET /matrial_requests/1
  # GET /matrial_requests/1.json
  def show
  end

  # GET /matrial_requests/new
  def new
    @matrial_request = MatrialRequest.new
  end

  # GET /matrial_requests/1/edit
  def edit
  end

  # POST /matrial_requests
  # POST /matrial_requests.json
  def create
    @matrial_request = MatrialRequest.new(matrial_request_params)

    respond_to do |format|
      if @matrial_request.save
        format.html { redirect_to @matrial_request, notice: 'Material request was successfully created.' }
        format.json { render :show, status: :created, location: @matrial_request }
      else
        format.html { render :new }
        format.json { render json: @matrial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matrial_requests/1
  # PATCH/PUT /matrial_requests/1.json
  def update
    respond_to do |format|
      if @matrial_request.update(matrial_request_params)
        format.html { redirect_to breakdown_spares_path(mr_id: @matrial_request.id), notice: 'Material request was successfully updated.' }
        format.json { render :show, status: :ok, location: @matrial_request }
      else
        format.html { render :edit }
        format.json { render json: @matrial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matrial_requests/1
  # DELETE /matrial_requests/1.json
  def destroy
    @matrial_request.destroy
    respond_to do |format|
      format.html { redirect_to matrial_requests_url, notice: 'Material request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # by hany
  def create_purchase_request_with_willpurchase_spares
    
    current_matrial_request = MatrialRequest.find(params[:mr_id])
    current_matrial_request.breakdown_spares.where(spare_status: :willpurchase).where(purchase_request_id: nil).each_with_index do |spare, index|

      if index == 0
        @purchase_request = PurchaseRequest.create!(matrial_request_id: params[:mr_id])
      end

      spare.purchase_request_id = @purchase_request.id
      spare.save!
    end

    if @purchase_request
      redirect_to edit_purchase_request_path(@purchase_request), notice: 'Repair order was successfully created.'
    else
      redirect_to matrial_requests_path, alert: 'No spares with status Will Purchase yet.'
    end

  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matrial_request
      @matrial_request = MatrialRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matrial_request_params
      params.require(:matrial_request).permit(:repair_order_id, :area_asset_id, :user_id, :store_done, :store_done_date, :manager_done, :manager_done_date, breakdown_spares_attributes: BreakdownSpare.attribute_names.map(&:to_sym))
    end
end
