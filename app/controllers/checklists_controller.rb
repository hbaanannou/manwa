class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]

  # GET /checklists
  def index
    @q = Checklist.includes(:data_asset, :user, :employee).ransack(params[:q])
    @checklists = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
  end


  def monthly
    if (!params[:asset_id].blank? && !params[:start_date].blank? && !params[:end_date].blank?)
      @checklists = policy_scope(Checklist.includes(:data_asset).where(data_asset_id: params[:asset_id]).where(day: (params[:start_date])..(params[:end_date])).order(day: :desc).paginate(:page => params[:page], :per_page => 20))
      @checklists_pdf = policy_scope(Checklist.includes(:data_asset).where(data_asset_id: params[:asset_id]).where(day: (params[:start_date])..(params[:end_date])).order(day: :desc))
    end

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "checklists", layout: "pdf/pdf_layout", orientation: 'Landscape', header: { right: '[page] of [topage]' }
      end
    end

  end


  # GET /checklists/1
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new

    if params[:asset_id] && !params[:asset_id].blank?
      @data_asset = DataAsset.find(params[:asset_id])
    end
    
  end

  # GET /checklists/1/edit
  def edit
    if params[:asset_id]
      @data_asset = DataAsset.find(params[:asset_id])
    end
  end

  # POST /checklists
  def create
    if params[:asset_id]
      @data_asset = DataAsset.find(params[:asset_id])
    end

    @checklist = Checklist.new(checklist_params)

    @checklist.user_id = current_user.id


    if @checklist.save
      if params[:asset_id]
        redirect_to new_checklist_path(asset_id: @data_asset.id, previous_checklist: @checklist), notice: 'Checklist was successfully created.'
      else
        redirect_to new_checklist_path(previous_checklist: @checklist), notice: 'Checklist was successfully created.'
      end
    else
      render :new
    end


rescue ActiveRecord::RecordNotUnique => e
  if e.is_a?(ActiveRecord::RecordNotUnique) && e.cause.message.match('unique constraint "index_checklists_on_data_asset_id_and_day"')
    flash[:alert] = "Asset Number Duplication For Same Day."
    render :new
  else
    # not something we expected
    raise
  end


  end

  # PATCH/PUT /checklists/1
  def update
    if params[:asset_id]
      @data_asset = DataAsset.find(params[:asset_id])
    end

    if @checklist.update(checklist_params)
      redirect_to @checklist, notice: 'Checklist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /checklists/1
  def destroy
    @checklist.destroy
    redirect_to checklists_url(asset_id: params[:asset_id]), notice: 'Checklist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checklist_params
      params.require(:checklist).permit(:data_asset_id, :user_id, :employee_id, :supervisor_id, :site_asset_id, :notes, :wrong_site, :wrong_employee, :day, :engine_oil, :hydraulic_oil, :gear_oil, :breake_oil, :battery_water, :air_filter, :fuel_water_separator, :fuel_tank, :radiator_coolant_hoses, :lights_gauges, :joints_pto_shaft, :chain_tension, :tire_pressure, :tire_bolt, :fan_belt_tension, :air_tank, :hours, :meters)
    end
end