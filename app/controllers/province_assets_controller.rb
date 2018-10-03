class ProvinceAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_province_asset, only: [:show, :edit, :update, :destroy]

  # GET /province_assets
  def index
    @q = ProvinceAsset.includes(:area_asset).ransack(params[:q])

    @province_assets = @q.result.order(province_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /province_assets/1
  def show
  end

  # GET /province_assets/new
  def new
    @province_asset = ProvinceAsset.new
  end

  # GET /province_assets/1/edit
  def edit
  end

  # POST /province_assets
  def create
    @province_asset = ProvinceAsset.new(province_asset_params)

    if @province_asset.save
      redirect_to @province_asset, notice: 'Province asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /province_assets/1
  def update
    if @province_asset.update(province_asset_params)
      redirect_to @province_asset, notice: 'Province asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /province_assets/1
  def destroy
    @province_asset.destroy
    redirect_to province_assets_url, notice: 'Province asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province_asset
      @province_asset = ProvinceAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def province_asset_params
      params.require(:province_asset).permit(:Province_asset_name, :area_asset_id, :user_id)
    end
end
