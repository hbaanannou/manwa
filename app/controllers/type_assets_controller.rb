class TypeAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_asset, only: [:show, :edit, :update, :destroy]

  # GET /type_assets
  def index
    @type_assets = TypeAsset.order(type_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /type_assets/1
  def show
  end

  # GET /type_assets/new
  def new
    @type_asset = TypeAsset.new
  end

  # GET /type_assets/1/edit
  def edit
  end

  # POST /type_assets
  def create
    @type_asset = TypeAsset.new(type_asset_params)

    if @type_asset.save
      redirect_to @type_asset, notice: 'Type asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /type_assets/1
  def update
    if @type_asset.update(type_asset_params)
      redirect_to @type_asset, notice: 'Type asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /type_assets/1
  def destroy
    @type_asset.destroy
    redirect_to type_assets_url, notice: 'Type asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_asset
      @type_asset = TypeAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_asset_params
      params.require(:type_asset).permit(:type_asset_name, model_asset_ids: [])
    end
end
