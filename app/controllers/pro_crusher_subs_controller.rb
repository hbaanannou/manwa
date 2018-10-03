class ProCrusherSubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_crusher_sub, only: [:show, :edit, :update, :destroy]

  # GET /pro_crusher_subs
  # GET /pro_crusher_subs.json
  def index

     @q = ProCrusherSub.includes(:pro_crusher, :pro_crusher_type, :pro_reason).ransack(params[:q])

    if params[:pro_crusher_id]
    @pro_crusher_subs = policy_scope(@q.result.where(pro_crusher_id: params[:pro_crusher_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
    @pro_crusher_subs = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    end
  end

  # GET /pro_crusher_subs/1
  # GET /pro_crusher_subs/1.json
  def show
  end

  # GET /pro_crusher_subs/new
  def new
    @pro_crusher_sub = ProCrusherSub.new
  end

  # GET /pro_crusher_subs/1/edit
  def edit
  end

  # POST /pro_crusher_subs
  # POST /pro_crusher_subs.json
  def create
    @pro_crusher_sub = ProCrusherSub.new(pro_crusher_sub_params)

    respond_to do |format|
      if @pro_crusher_sub.save
        format.html { redirect_to @pro_crusher_sub, notice: 'Pro crusher sub was successfully created.' }
        format.json { render :show, status: :created, location: @pro_crusher_sub }
      else
        format.html { render :new }
        format.json { render json: @pro_crusher_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_crusher_subs/1
  # PATCH/PUT /pro_crusher_subs/1.json
  def update
    respond_to do |format|
      if @pro_crusher_sub.update(pro_crusher_sub_params)
        format.html { redirect_to @pro_crusher_sub, notice: 'Pro crusher sub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_crusher_sub }
      else
        format.html { render :edit }
        format.json { render json: @pro_crusher_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_crusher_subs/1
  # DELETE /pro_crusher_subs/1.json
  def destroy
    @pro_crusher_sub.destroy
    respond_to do |format|
      format.html { redirect_to pro_crusher_subs_url, notice: 'Pro crusher sub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_crusher_sub
      @pro_crusher_sub = ProCrusherSub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_crusher_sub_params
      params.require(:pro_crusher_sub).permit(:pro_crusher_id, :pro_crusher_type_id, :measurement, :pro_crusher_amount, :pro_crusher_amount_meters, :pro_reason_id, :pro_crusher_note)
    end
end
