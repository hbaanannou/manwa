class AssetFueldaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_asset_fuelday, only: [:show, :edit, :update, :destroy]

  # GET /asset_fueldays
  def index
    if params[:tank_id]
       @q = AssetFuelday.includes(:tank_fuelday, :data_asset).where(tank_fuelday_id: params[:tank_id]).ransack(params[:q])

      @asset_fueldays = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
    else
      @q = AssetFuelday.includes(:tank_fuelday, :data_asset).ransack(params[:q])

      @asset_fueldays = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
    end

    @asset_fueldays_pdf = policy_scope(@q.result.order(day: :desc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "asset_fueldays", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end


  end

  # GET /asset_fueldays/1
  def show
  end

  # GET /asset_fueldays/new
  def new
    @asset_fuelday = AssetFuelday.new
  end

  # GET /asset_fueldays/1/edit
  def edit
  end

  # POST /asset_fueldays
  def create
    @asset_fuelday = AssetFuelday.new(asset_fuelday_params)

    if @asset_fuelday.save
      redirect_to @asset_fuelday, notice: 'Asset fuelday was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /asset_fueldays/1
  def update
    if @asset_fuelday.update(asset_fuelday_params)
      redirect_to @asset_fuelday, notice: 'Asset fuelday was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /asset_fueldays/1
  def destroy
    @asset_fuelday.destroy
    redirect_to asset_fueldays_url(tank_id: params[:tank_id]), notice: 'Asset fuelday was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_fuelday
      @asset_fuelday = AssetFuelday.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def asset_fuelday_params
      params.require(:asset_fuelday).permit(:tank_fuelday_id, :data_asset_id, :quantity)
    end
end
