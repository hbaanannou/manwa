class ColorAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_color_asset, only: [:show, :edit, :update, :destroy]

  # GET /color_assets
  def index
    @color_assets = ColorAsset.order(color_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /color_assets/1
  def show
  end

  # GET /color_assets/new
  def new
    @color_asset = ColorAsset.new
  end

  # GET /color_assets/1/edit
  def edit
  end

  # POST /color_assets
  def create
    @color_asset = ColorAsset.new(color_asset_params)

    if @color_asset.save
      redirect_to @color_asset, notice: 'Color asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /color_assets/1
  def update
    if @color_asset.update(color_asset_params)
      redirect_to @color_asset, notice: 'Color asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /color_assets/1
  def destroy
    @color_asset.destroy
    redirect_to color_assets_url, notice: 'Color asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_asset
      @color_asset = ColorAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def color_asset_params
      params.require(:color_asset).permit(:color_asset_name)
    end
end
