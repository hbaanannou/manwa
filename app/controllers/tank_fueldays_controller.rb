class TankFueldaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tank_fuelday, only: [:show, :edit, :update, :destroy]

  # GET /tank_fueldays
  def index
    @q = TankFuelday.includes(:data_asset, :user, :employee, :site_asset).ransack(params[:q])
    
    @tank_fueldays = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))

    @tank_fueldays_pdf = policy_scope(@q.result.order(day: :desc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "tank_fueldays", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end

  end

  # GET /tank_fueldays/1
  def show
  end

  # GET /tank_fueldays/new
  def new
    @tank_fuelday = TankFuelday.new

    3.times do
      @tank_fuelday.asset_fueldays.build
    end

  end

  # GET /tank_fueldays/1/edit
  def edit
  end

  # POST /tank_fueldays
  def create
    @tank_fuelday = TankFuelday.new(tank_fuelday_params)

    @tank_fuelday.user_id = current_user.id

    # adding tank_fuelday day in asset_fueldays to check unique seerial per day
    @tank_fuelday.asset_fueldays.each do |asset_fuelday|
      asset_fuelday.day = @tank_fuelday.day
    end


    if @tank_fuelday.save
      redirect_to new_tank_fuelday_path(asset_id: @tank_fuelday.data_asset_id, previous_tank_fuelday: @tank_fuelday), notice: 'Tank fuelday was successfully created.'
    else
      @tank_fuelday.asset_fueldays.build
      render :new
    end


rescue ActiveRecord::RecordNotUnique => e
  if e.is_a?(ActiveRecord::RecordNotUnique) && e.cause.message.match('unique constraint "index_asset_fueldays_on_data_asset_id_and_day"')
    flash[:alert] = "Asset Number Duplication For Same Day."
    render :new
  else
    # not something we expected
    raise
  end


  end

  # PATCH/PUT /tank_fueldays/1
  def update
    if @tank_fuelday.update(tank_fuelday_params)
      redirect_to @tank_fuelday, notice: 'Tank fuelday was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tank_fueldays/1
  def destroy
    @tank_fuelday.destroy
    redirect_to tank_fueldays_url, notice: 'Tank fuelday was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank_fuelday
      @tank_fuelday = TankFuelday.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tank_fuelday_params
      params.require(:tank_fuelday).permit(:day, :data_asset_id, :user_id, :employee_id, :site_asset_id, asset_fueldays_attributes: AssetFuelday.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
