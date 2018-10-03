class ModelAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model_asset, only: [:show, :edit, :update, :destroy]

  # GET /model_assets
  def index
    @model_assets = ModelAsset.order(model_asset_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /model_assets/1
  def show
  end

  # GET /model_assets/new
  def new
    @model_asset = ModelAsset.new
  end

  # GET /model_assets/1/edit
  def edit
  end

  # POST /model_assets
  def create
    @model_asset = ModelAsset.new(model_asset_params)

    if @model_asset.save
      redirect_to @model_asset, notice: 'Model asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /model_assets/1
  def update
    if @model_asset.update(model_asset_params)
      redirect_to @model_asset, notice: 'Model asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /model_assets/1
  def destroy
    @model_asset.destroy
    redirect_to model_assets_url, notice: 'Model asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_asset
      @model_asset = ModelAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_asset_params
      params.require(:model_asset).permit(:model_asset_name, type_asset_ids: [])
    end
end