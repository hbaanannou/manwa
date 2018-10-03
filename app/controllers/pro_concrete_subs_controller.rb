class ProConcreteSubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_concrete_sub, only: [:show, :edit, :update, :destroy]

  # GET /pro_concrete_subs
  # GET /pro_concrete_subs.json
  def index
    @q = ProConcreteSub.includes(:pro_concrete, :pro_concrete_type, :pro_concrete_product, :pro_reason).ransack(params[:q])

    if params[:pro_concrete_id]
    @pro_concrete_subs = policy_scope(@q.result.where(pro_concrete_id: params[:pro_concrete_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    else
    @pro_concrete_subs = policy_scope(@q.result.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20))
    end
  end

  # GET /pro_concrete_subs/1
  # GET /pro_concrete_subs/1.json
  def show
  end

  # GET /pro_concrete_subs/new
  def new
    @pro_concrete_sub = ProConcreteSub.new
  end

  # GET /pro_concrete_subs/1/edit
  def edit
  end

  # POST /pro_concrete_subs
  # POST /pro_concrete_subs.json
  def create
    @pro_concrete_sub = ProConcreteSub.new(pro_concrete_sub_params)

    respond_to do |format|
      if @pro_concrete_sub.save
        format.html { redirect_to @pro_concrete_sub, notice: 'Pro concrete sub was successfully created.' }
        format.json { render :show, status: :created, location: @pro_concrete_sub }
      else
        format.html { render :new }
        format.json { render json: @pro_concrete_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_concrete_subs/1
  # PATCH/PUT /pro_concrete_subs/1.json
  def update
    respond_to do |format|
      if @pro_concrete_sub.update(pro_concrete_sub_params)
        format.html { redirect_to @pro_concrete_sub, notice: 'Pro concrete sub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_concrete_sub }
      else
        format.html { render :edit }
        format.json { render json: @pro_concrete_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_concrete_subs/1
  # DELETE /pro_concrete_subs/1.json
  def destroy
    @pro_concrete_sub.destroy
    respond_to do |format|
      format.html { redirect_to pro_concrete_subs_url, notice: 'Pro concrete sub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_concrete_sub
      @pro_concrete_sub = ProConcreteSub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_concrete_sub_params
      params.require(:pro_concrete_sub).permit(:pro_concrete_id, :pro_concrete_type_id, :ProConcrete, :pro_concrete_product_id, :pro_concrete_amount, :pro_reason_id, :pro_concrete_note)
    end
end
