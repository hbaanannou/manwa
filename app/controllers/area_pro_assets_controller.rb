class AreaProAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area_pro_asset, only: [:show, :edit, :update, :destroy]

  # GET /area_pro_assets
  # GET /area_pro_assets.json
  def index
    @area_pro_assets = AreaProAsset.order(area_pro_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /area_pro_assets/1
  # GET /area_pro_assets/1.json
  def show
  end

  # GET /area_pro_assets/new
  def new
    @area_pro_asset = AreaProAsset.new
  end

  # GET /area_pro_assets/1/edit
  def edit
  end

  # POST /area_pro_assets
  # POST /area_pro_assets.json
  def create
    @area_pro_asset = AreaProAsset.new(area_pro_asset_params)

    respond_to do |format|
      if @area_pro_asset.save
        format.html { redirect_to @area_pro_asset, notice: 'Area pro asset was successfully created.' }
        format.json { render :show, status: :created, location: @area_pro_asset }
      else
        format.html { render :new }
        format.json { render json: @area_pro_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_pro_assets/1
  # PATCH/PUT /area_pro_assets/1.json
  def update
    respond_to do |format|
      if @area_pro_asset.update(area_pro_asset_params)
        format.html { redirect_to @area_pro_asset, notice: 'Area pro asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_pro_asset }
      else
        format.html { render :edit }
        format.json { render json: @area_pro_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_pro_assets/1
  # DELETE /area_pro_assets/1.json
  def destroy
    @area_pro_asset.destroy
    respond_to do |format|
      format.html { redirect_to area_pro_assets_url, notice: 'Area pro asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def area_pro
    respond_to do |format|
      format.html
      format.js
    end
  end

  def con_area_pro_lines

    if params[:start_date].present?
      session[:start_date] = params[:start_date]
    elsif params[:end_date].present?
      session[:end_date] = params[:end_date]
    elsif params[:start_date].nil? and params[:end_date].nil?
      session[:start_date] = nil
      session[:end_date] = nil
    end


    if params[:con_chart_display].present?
      session[:con_chart_display] = params[:con_chart_display]
    else
      session[:con_chart_display] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end

  def asph_area_pro_lines

    if params[:start_date].present?
      session[:start_date] = params[:start_date]
    elsif params[:end_date].present?
      session[:end_date] = params[:end_date]
    elsif params[:start_date].nil? and params[:end_date].nil?
      session[:start_date] = nil
      session[:end_date] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end

  def cru_area_pro_lines

    if params[:start_date].present?
      session[:start_date] = params[:start_date]
    elsif params[:end_date].present?
      session[:end_date] = params[:end_date]
    elsif params[:start_date].nil? and params[:end_date].nil?
      session[:start_date] = nil
      session[:end_date] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_pro_asset
      @area_pro_asset = AreaProAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_pro_asset_params
      params.require(:area_pro_asset).permit(:area_pro_asset_name)
    end
end
