class ProReasonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_reason, only: [:show, :edit, :update, :destroy]

  # GET /pro_reasons
  # GET /pro_reasons.json
  def index
    @q = ProReason.ransack(params[:q])
    @pro_reasons = @q.result.order(pro_reason_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_reasons/1
  # GET /pro_reasons/1.json
  def show
  end

  # GET /pro_reasons/new
  def new
    @pro_reason = ProReason.new
  end

  # GET /pro_reasons/1/edit
  def edit
  end

  # POST /pro_reasons
  # POST /pro_reasons.json
  def create
    @pro_reason = ProReason.new(pro_reason_params)

    respond_to do |format|
      if @pro_reason.save
        format.html { redirect_to @pro_reason, notice: 'Pro reason was successfully created.' }
        format.json { render :show, status: :created, location: @pro_reason }
      else
        format.html { render :new }
        format.json { render json: @pro_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_reasons/1
  # PATCH/PUT /pro_reasons/1.json
  def update
    respond_to do |format|
      if @pro_reason.update(pro_reason_params)
        format.html { redirect_to @pro_reason, notice: 'Pro reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_reason }
      else
        format.html { render :edit }
        format.json { render json: @pro_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_reasons/1
  # DELETE /pro_reasons/1.json
  def destroy
    @pro_reason.destroy
    respond_to do |format|
      format.html { redirect_to pro_reasons_url, notice: 'Pro reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_reason
      @pro_reason = ProReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_reason_params
      params.require(:pro_reason).permit(:pro_reason_name)
    end
end
