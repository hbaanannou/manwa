class AccidentAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_accident_asset, only: [:show, :edit, :update, :destroy]

  # GET /accident_assets
  def index
    @accident_assets = AccidentAsset.order(accident_asset_date: :desc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /accident_assets/1
  def show
  end

  # GET /accident_assets/new
  def new
    @accident_asset = AccidentAsset.new
  end

  # GET /accident_assets/1/edit
  def edit
  end

  # POST /accident_assets
  def create
    @accident_asset = AccidentAsset.new(accident_asset_params)

    if @accident_asset.save
      redirect_to @accident_asset, notice: 'Accident asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accident_assets/1
  def update
    if @accident_asset.update(accident_asset_params)
      redirect_to @accident_asset, notice: 'Accident asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accident_assets/1
  def destroy
    @accident_asset.destroy
    redirect_to accident_assets_url, notice: 'Accident asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accident_asset
      @accident_asset = AccidentAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accident_asset_params
      params.require(:accident_asset).permit(:data_asset_id, :accident_asset_date, :accident_asset_remarks)
    end
end
