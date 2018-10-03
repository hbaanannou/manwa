class ProCrushersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_crusher, only: [:show, :edit, :update, :destroy]

  # GET /pro_crushers
  # GET /pro_crushers.json
  def index
    @q = ProCrusher.ransack(params[:q])
    @pro_crushers = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
  end

  # GET /pro_crushers/1
  # GET /pro_crushers/1.json
  def show
  end

  # GET /pro_crushers/new
  def new
    @pro_crusher = ProCrusher.new

    3.times do
      @pro_crusher.pro_crusher_subs.build
    end
    
  end

  # GET /pro_crushers/1/edit
  def edit
  end

  # POST /pro_crushers
  # POST /pro_crushers.json
  def create
    @pro_crusher = ProCrusher.new(pro_crusher_params)

    respond_to do |format|
      if @pro_crusher.save
        format.html { redirect_to pro_crushers_path(@pro_crusher), notice: 'Pro crusher was successfully created.' }
        format.json { render :show, status: :created, location: @pro_crusher }
      else
        format.html { render :new }
        format.json { render json: @pro_crusher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_crushers/1
  # PATCH/PUT /pro_crushers/1.json
  def update
    respond_to do |format|
      if @pro_crusher.update(pro_crusher_params)
        format.html { redirect_to pro_crushers_path(@pro_crusher), notice: 'Pro crusher was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_crusher }
      else
        format.html { render :edit }
        format.json { render json: @pro_crusher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_crushers/1
  # DELETE /pro_crushers/1.json
  def destroy
    @pro_crusher.destroy
    respond_to do |format|
      format.html { redirect_to pro_crushers_url, notice: 'Pro crusher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_crusher
      @pro_crusher = ProCrusher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_crusher_params
      params.require(:pro_crusher).permit(:province_pro_asset_id, :day, :pro_crusher_hours, :pro_crusher_machines_num, pro_crusher_subs_attributes: ProCrusherSub.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
