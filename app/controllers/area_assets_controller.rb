class AreaAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area_asset, only: [:show, :edit, :update, :destroy]

  # GET /area_assets
  def index
    @area_assets = AreaAsset.order(area_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /area_assets/1
  def show
  end

  # GET /area_assets/new
  def new
    @area_asset = AreaAsset.new
  end

  # GET /area_assets/1/edit
  def edit
  end

  # POST /area_assets
  def create
    @area_asset = AreaAsset.new(area_asset_params)

    if @area_asset.save
      redirect_to @area_asset, notice: 'Area asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /area_assets/1
  def update
    if @area_asset.update(area_asset_params)
      redirect_to @area_asset, notice: 'Area asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /area_assets/1
  def destroy
    @area_asset.destroy
    redirect_to area_assets_url, notice: 'Area asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_asset
      @area_asset = AreaAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_asset_params
      params.require(:area_asset).permit(:area_asset_name, :user_id, :area_asset_remarks, :area_asset_active)
    end
end
