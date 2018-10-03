class DataAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_data_asset, only: [:show, :edit, :update]


  # GET /data_assets
  def index
    @q = DataAsset.includes(:user, :status_asset, :type_asset, :model_asset, :province_asset, :site_asset, :employee, :color_asset).ransack(params[:q])

    @data_assets = policy_scope(@q.result.order(data_asset_serial: :asc).paginate(:page => params[:page], :per_page => 20))

    @data_assets_pdf = policy_scope(@q.result.order(data_asset_serial: :asc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "assets", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  def index_soft
    @q = DataAsset.includes(:user, :status_asset, :type_asset, :model_asset, :province_asset, :site_asset, :employee, :color_asset).only_deleted.ransack(params[:q])

    @data_assets = policy_scope(@q.result.order(data_asset_serial: :asc).paginate(:page => params[:page], :per_page => 20))

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /data_assets/1
  def show
    authorize @data_asset

    @q = DataAsset.includes(:user, :status_asset, :type_asset, :model_asset, :province_asset, :site_asset, :employee, :color_asset).ransack(params[:q])
    @data_assets = policy_scope(@q.result.order(data_asset_serial: :asc))

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "assets", layout: "pdf/pdf_layout_show"
      end
    end

  end

  # GET /data_assets/new
  def new
    @data_asset = DataAsset.new
    authorize @data_asset
  end

  # GET /data_assets/1/edit
  def edit
    authorize @data_asset
  end

  # POST /data_assets
  def create
    @data_asset = DataAsset.new(data_asset_params)
    authorize @data_asset
    
    @data_asset.user = current_user
    

    if @data_asset.save
      redirect_to @data_asset, notice: 'Data asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /data_assets/1
  def update
    authorize @data_asset
    @data_asset.user = current_user
    if @data_asset.update(data_asset_params)
      redirect_to @data_asset, notice: 'Data asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /data_assets/1
  def destroy

    if params[:type] == 'normal'
      @data_asset = DataAsset.find(params[:id])
    elsif params[:type] == 'forever'
      @data_asset = DataAsset.only_deleted.find(params[:id])
    elsif params[:type] == 'undelete'
      @data_asset = DataAsset.only_deleted.find(params[:id])
    end

    authorize @data_asset

    if params[:type] == 'normal'
      @data_asset.destroy
      redirect_to data_assets_url, notice: 'Data asset was successfully destroyed.'
    elsif params[:type] == 'forever'
      @data_asset.really_destroy!
      redirect_to index_soft_data_assets_url, notice: 'Data asset was successfully destroyed Forever.'
    elsif params[:type] == 'undelete'
      @data_asset.restore
      redirect_to index_soft_data_assets_url, notice: 'Data asset was successfully Restored.'
    end
    
  end



  def charts

    if session[:start_date].present?
    start_date = session[:start_date].to_date
    end

    if session[:end_date].present?
    end_date = session[:end_date].to_date
    end



    from_60 = Checklist.pluck(:day).max - 60 if Checklist.any?
    first_date = Checklist.where(" day > ? ", from_60).any? ? Checklist.where(" day > ? ", from_60).pluck(:day).min : Checklist.pluck(:day).min
    last_date = Checklist.pluck(:day).max

if (session[:start_date].present? and session[:end_date].present?)

  @pdf_hour_lines = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).select(:day, :hours).group(:day, :hours).order(:day)


  @pdf_workdays_count = ((start_date)..(end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).count



  @pdf_checklists_engine_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).where(air_tank: true).count


  @pdf_checklists_hours_sum = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(end_date)).pluck(:meters).count

elsif (session[:start_date].present? and !session[:end_date].present?)
  @pdf_hour_lines = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((start_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (start_date)..(last_date)).pluck(:meters).count

elsif (!session[:start_date].present? and session[:end_date].present?)
  @pdf_hour_lines = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((first_date)..(end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(end_date)).pluck(:meters).count


elsif (!session[:start_date].present? and !session[:end_date].present? and Checklist.any?)
  @pdf_hour_lines = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((first_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(data_asset_id: params[:asset_id]).where(day: (first_date)..(last_date)).pluck(:meters).count


end


    params[:asset_id] ||= policy_scope(DataAsset.all).first.id

    @data_assets = policy_scope(DataAsset.all)
    authorize @data_assets

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "operations", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  

  def hours_line

    if params[:start_date].present?
      session[:start_date] = params[:start_date]
    elsif params[:end_date].present?
      session[:end_date] = params[:end_date]
    elsif params[:start_date].nil? and params[:end_date].nil?
      session[:start_date] = nil
      session[:end_date] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end




  def emp_charts

if session[:emp_start_date].present?
emp_start_date = session[:emp_start_date].to_date
end

if session[:emp_end_date].present?
emp_end_date = session[:emp_end_date].to_date
end



from_60 = Checklist.pluck(:day).max - 60 if Checklist.any?
first_date = Checklist.where(" day > ? ", from_60).any? ? Checklist.where(" day > ? ", from_60).pluck(:day).min : Checklist.pluck(:day).min
last_date = Checklist.pluck(:day).max

if (session[:emp_start_date].present? and session[:emp_end_date].present?)

  @pdf_hour_lines = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).select(:day, :hours).group(:day, :hours).order(:day)


  @pdf_workdays_count = ((emp_start_date)..(emp_end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).count



  @pdf_checklists_engine_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(air_tank: true).count


  @pdf_checklists_hours_sum = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).count

elsif (session[:emp_start_date].present? and !session[:emp_end_date].present?)
  @pdf_hour_lines = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((emp_start_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).count

elsif (!session[:emp_start_date].present? and session[:emp_end_date].present?)
  @pdf_hour_lines = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((first_date)..(emp_end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).count


elsif (!session[:emp_start_date].present? and !session[:emp_end_date].present? and Checklist.any?)
  @pdf_hour_lines = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  @pdf_workdays_count = ((first_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  @pdf_checklists_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).count

  @pdf_checklists_engine_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(engine_oil: true).count
  @pdf_checklists_hydraulic_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(hydraulic_oil: true).count
  @pdf_checklists_gear_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(gear_oil: true).count
  @pdf_checklists_breake_oil_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(breake_oil: true).count
  @pdf_checklists_battery_water_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(battery_water: true).count
  @pdf_checklists_air_filter_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(air_filter: true).count
  @pdf_checklists_fuel_water_separator_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fuel_water_separator: true).count
  @pdf_checklists_fuel_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fuel_tank: true).count
  @pdf_checklists_radiator_coolant_hoses_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(radiator_coolant_hoses: true).count
  @pdf_checklists_lights_gauges_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(lights_gauges: true).count
  @pdf_checklists_joints_pto_shaft_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(joints_pto_shaft: true).count
  @pdf_checklists_chain_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(chain_tension: true).count
  @pdf_checklists_tire_pressure_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(tire_pressure: true).count
  @pdf_checklists_tire_bolt_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(tire_bolt: true).count
  @pdf_checklists_fan_belt_tension_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fan_belt_tension: true).count
  @pdf_checklists_air_tank_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(air_tank: true).count

  @pdf_checklists_hours_sum = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).sum(:hours)
  @pdf_checklists_hours_average = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).average(:hours)

  @pdf_checklists_meters_start_date = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).min
  @pdf_checklists_meters_end_date = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).max
  @pdf_checklists_meters_count = Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).count


end




    params[:emp_id] ||= policy_scope(Employee.all).first.id

    @employees = policy_scope(Employee.all)
    authorize @employees

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "emp_operations", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  def emp_hours_line

    if params[:emp_start_date].present?
      session[:emp_start_date] = params[:emp_start_date]
    elsif params[:emp_end_date].present?
      session[:emp_end_date] = params[:emp_end_date]
    elsif params[:emp_start_date].nil? and params[:emp_end_date].nil?
      session[:emp_start_date] = nil
      session[:emp_end_date] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_asset
      @data_asset = DataAsset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def data_asset_params
      params.require(:data_asset).permit(policy(@data_asset).permitted_attributes)
    end
end
