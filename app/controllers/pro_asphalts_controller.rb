class ProAsphaltsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_asphalt, only: [:show, :edit, :update, :destroy]

  # GET /pro_asphalts
  # GET /pro_asphalts.json
  def index
    @q = ProAsphalt.ransack(params[:q])
    @pro_asphalts = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
  end

  # GET /pro_asphalts/1
  # GET /pro_asphalts/1.json
  def show
  end

  # GET /pro_asphalts/new
  def new
    @pro_asphalt = ProAsphalt.new

    3.times do
      @pro_asphalt.pro_asphalt_subs.build
    end

  end

  # GET /pro_asphalts/1/edit
  def edit
  end

  # POST /pro_asphalts
  # POST /pro_asphalts.json
  def create
    @pro_asphalt = ProAsphalt.new(pro_asphalt_params)

    respond_to do |format|
      if @pro_asphalt.save
        format.html { redirect_to pro_asphalts_path(@pro_asphalt), notice: 'Pro asphalt was successfully created.' }
        format.json { render :show, status: :created, location: @pro_asphalt }
      else
        format.html { render :new }
        format.json { render json: @pro_asphalt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_asphalts/1
  # PATCH/PUT /pro_asphalts/1.json
  def update
    respond_to do |format|
      if @pro_asphalt.update(pro_asphalt_params)
        format.html { redirect_to pro_asphalts_path(@pro_asphalt), notice: 'Pro asphalt was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_asphalt }
      else
        format.html { render :edit }
        format.json { render json: @pro_asphalt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_asphalts/1
  # DELETE /pro_asphalts/1.json
  def destroy
    @pro_asphalt.destroy
    respond_to do |format|
      format.html { redirect_to pro_asphalts_url, notice: 'Pro asphalt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_asphalt
      @pro_asphalt = ProAsphalt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_asphalt_params
      params.require(:pro_asphalt).permit(:province_pro_asset_id, :day, :pro_asphalt_hours, :pro_asphalt_machines_num, pro_asphalt_subs_attributes: ProAsphaltSub.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
