class ProAsphaltSubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_asphalt_sub, only: [:show, :edit, :update, :destroy]

  # GET /pro_asphalt_subs
  # GET /pro_asphalt_subs.json
  def index

    @q = ProAsphaltSub.includes(:pro_asphalt, :pro_asphalt_type, :pro_asphalt_product, :pro_reason).ransack(params[:q])

    if params[:pro_asphalt_id]
    @pro_asphalt_subs = policy_scope(@q.result.where(pro_asphalt_id: params[:pro_asphalt_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
    @pro_asphalt_subs = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    end

  end

  # GET /pro_asphalt_subs/1
  # GET /pro_asphalt_subs/1.json
  def show
  end

  # GET /pro_asphalt_subs/new
  def new
    @pro_asphalt_sub = ProAsphaltSub.new
  end

  # GET /pro_asphalt_subs/1/edit
  def edit
  end

  # POST /pro_asphalt_subs
  # POST /pro_asphalt_subs.json
  def create
    @pro_asphalt_sub = ProAsphaltSub.new(pro_asphalt_sub_params)

    respond_to do |format|
      if @pro_asphalt_sub.save
        format.html { redirect_to @pro_asphalt_sub, notice: 'Pro asphalt sub was successfully created.' }
        format.json { render :show, status: :created, location: @pro_asphalt_sub }
      else
        format.html { render :new }
        format.json { render json: @pro_asphalt_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_asphalt_subs/1
  # PATCH/PUT /pro_asphalt_subs/1.json
  def update
    respond_to do |format|
      if @pro_asphalt_sub.update(pro_asphalt_sub_params)
        format.html { redirect_to @pro_asphalt_sub, notice: 'Pro asphalt sub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_asphalt_sub }
      else
        format.html { render :edit }
        format.json { render json: @pro_asphalt_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_asphalt_subs/1
  # DELETE /pro_asphalt_subs/1.json
  def destroy
    @pro_asphalt_sub.destroy
    respond_to do |format|
      format.html { redirect_to pro_asphalt_subs_url, notice: 'Pro asphalt sub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_asphalt_sub
      @pro_asphalt_sub = ProAsphaltSub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_asphalt_sub_params
      params.require(:pro_asphalt_sub).permit(:pro_asphalt_id, :pro_asphalt_type_id, :pro_asphalt_product_id, :pro_asphalt_amount, :pro_reason_id, :pro_asphalt_note)
    end
end
