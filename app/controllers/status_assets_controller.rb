class StatusAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_status_asset, only: [:show, :edit, :update, :destroy]

  # GET /status_assets
  def index
    @status_assets = StatusAsset.order(status_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /status_assets/1
  def show
  end

  # GET /status_assets/new
  def new
    @status_asset = StatusAsset.new
  end

  # GET /status_assets/1/edit
  def edit
  end

  # POST /status_assets
  def create
    @status_asset = StatusAsset.new(status_asset_params)

    if @status_asset.save
      redirect_to @status_asset, notice: 'Status asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /status_assets/1
  def update
    if @status_asset.update(status_asset_params)
      redirect_to @status_asset, notice: 'Status asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /status_assets/1
  def destroy
    @status_asset.destroy
    redirect_to status_assets_url, notice: 'Status asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_asset
      @status_asset = StatusAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_asset_params
      params.require(:status_asset).permit(:status_asset_name)
    end
end
