class SiteAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site_asset, only: [:show, :edit, :update, :destroy]

  # GET /site_assets
  def index
    
    @q = SiteAsset.includes(:province_asset).ransack(params[:q])

    @site_assets = @q.result.order(site_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)


  end

  # GET /site_assets/1
  def show
  end

  # GET /site_assets/new
  def new
    @site_asset = SiteAsset.new
  end

  # GET /site_assets/1/edit
  def edit
  end

  # POST /site_assets
  def create
    @site_asset = SiteAsset.new(site_asset_params)

    if @site_asset.save
      redirect_to @site_asset, notice: 'Site asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /site_assets/1
  def update
    if @site_asset.update(site_asset_params)
      redirect_to @site_asset, notice: 'Site asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /site_assets/1
  def destroy
    @site_asset.destroy
    redirect_to site_assets_url, notice: 'Site asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_asset
      @site_asset = SiteAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_asset_params
      params.require(:site_asset).permit(:site_asset_name, :province_asset_id, :user_id, :site_asset_remarks, :site_asset_active)
    end
end
