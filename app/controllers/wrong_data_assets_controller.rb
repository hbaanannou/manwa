class WrongDataAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wrong_data_asset, only: [:show, :edit, :update, :destroy]

  # GET /wrong_data_assets
  # GET /wrong_data_assets.json
  def index
    @q = WrongDataAsset.includes(:data_asset, :checklist, :employee_now, :employee_should, :site_now, :site_should).ransack(params[:q])

    @wrong_data_assets = policy_scope(@q.result.order(data_asset_id: :asc).paginate(:page => params[:page], :per_page => 20))

  end

  # GET /wrong_data_assets/1
  # GET /wrong_data_assets/1.json
  def show
  end

  # GET /wrong_data_assets/new
  def new
    @wrong_data_asset = WrongDataAsset.new
  end

  # GET /wrong_data_assets/1/edit
  def edit
  end

  # POST /wrong_data_assets
  # POST /wrong_data_assets.json
  def create
    @wrong_data_asset = WrongDataAsset.new(wrong_data_asset_params)

    respond_to do |format|
      if @wrong_data_asset.save
        format.html { redirect_to @wrong_data_asset, notice: 'Wrong data asset was successfully created.' }
        format.json { render :show, status: :created, location: @wrong_data_asset }
      else
        format.html { render :new }
        format.json { render json: @wrong_data_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wrong_data_assets/1
  # PATCH/PUT /wrong_data_assets/1.json
  def update
    respond_to do |format|
      if @wrong_data_asset.update(wrong_data_asset_params)
        format.html { redirect_to @wrong_data_asset, notice: 'Wrong data asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @wrong_data_asset }
      else
        format.html { render :edit }
        format.json { render json: @wrong_data_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wrong_data_assets/1
  # DELETE /wrong_data_assets/1.json
  def destroy
    @wrong_data_asset.destroy
    respond_to do |format|
      format.html { redirect_to wrong_data_assets_url, notice: 'Wrong data asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wrong_data_asset
      @wrong_data_asset = WrongDataAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wrong_data_asset_params
      params.require(:wrong_data_asset).permit(:data_asset_id, :checklist_id, :employee_now_id, :employee_should_id, :site_now_id, :site_should_id)
    end
end
