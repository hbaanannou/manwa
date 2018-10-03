# json.history_lines Cbahi::HospitalHistory.order(:ovr_date)

# emp_start_date = params[:emp_start_date].to_date.beginning_of_day
# emp_end_date = session[:emp_end_date].to_date.end_of_day

if session[:emp_start_date].present?
emp_start_date = session[:emp_start_date].to_date
end

if session[:emp_end_date].present?
emp_end_date = session[:emp_end_date].to_date
end

# first_date = Ovrm::Ovr.pluck("date_trunc('month', ovr_date)").min
# last_date = Ovrm::Ovr.pluck("date_trunc('month', ovr_date)").max

# first_date = Ovrm::Ovr.pluck("distinct date_trunc('month', ovr_date) as ovr_date").min
# last_date = Ovrm::Ovr.pluck("distinct date_trunc('month', ovr_date) + INTERVAL '1 month' as ovr_date").max

# if (session[:emp_start_date].present? and session[:emp_end_date].present?)
#   json.history_lines Ovrm::Ovr.where(ovr_date: (emp_start_date)..(emp_end_date)).select("distinct date_trunc('month', ovr_date) as month, count(ovr_date) as ovrs_number ").group('month').order('month')
# elsif (session[:emp_start_date].present? and !session[:emp_end_date].present?)
#   json.history_lines Ovrm::Ovr.where(ovr_date: (emp_start_date)..(last_date)).select("distinct date_trunc('month', ovr_date) as month, count(ovr_date) as ovrs_number ").group('month').order('month')
# elsif (!session[:emp_start_date].present? and session[:emp_end_date].present?)
#   json.history_lines Ovrm::Ovr.where(ovr_date: (first_date)..(emp_end_date)).select("distinct date_trunc('month', ovr_date) as month, count(ovr_date) as ovrs_number ").group('month').order('month')
# elsif (!session[:emp_start_date].present? and !session[:emp_end_date].present?)
#   json.history_lines Ovrm::Ovr.where(ovr_date: (first_date)..(last_date)).select("distinct date_trunc('month', ovr_date) as month, count(ovr_date) as ovrs_number ").group('month').order('month')

      

# first_date = Checklist.pluck(:day).min

from_60 = Checklist.pluck(:day).max - 60 if Checklist.any?
first_date = Checklist.where(" day > ? ", from_60).any? ? Checklist.where(" day > ? ", from_60).pluck(:day).min : Checklist.pluck(:day).min
last_date = Checklist.pluck(:day).max

if (session[:emp_start_date].present? and session[:emp_end_date].present?)

  json.hour_lines Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).select(:day, :hours).group(:day, :hours).order(:day)


  json.workdays_count ((emp_start_date)..(emp_end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  json.checklists_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).count



  json.checklists_engine_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(engine_oil: true).count
  json.checklists_hydraulic_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(hydraulic_oil: true).count
  json.checklists_gear_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(gear_oil: true).count
  json.checklists_breake_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(breake_oil: true).count
  json.checklists_battery_water_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(battery_water: true).count
  json.checklists_air_filter_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(air_filter: true).count
  json.checklists_fuel_water_separator_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fuel_water_separator: true).count
  json.checklists_fuel_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fuel_tank: true).count
  json.checklists_radiator_coolant_hoses_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(radiator_coolant_hoses: true).count
  json.checklists_lights_gauges_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(lights_gauges: true).count
  json.checklists_joints_pto_shaft_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(joints_pto_shaft: true).count
  json.checklists_chain_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(chain_tension: true).count
  json.checklists_tire_pressure_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(tire_pressure: true).count
  json.checklists_tire_bolt_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(tire_bolt: true).count
  json.checklists_fan_belt_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(fan_belt_tension: true).count
  json.checklists_air_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).where(air_tank: true).count


  json.checklists_hours_sum Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).sum(:hours)
  json.checklists_hours_average Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).average(:hours)

  json.checklists_meters_emp_start_date Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).min
  json.checklists_meters_emp_end_date Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).max
  json.checklists_meters_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(emp_end_date)).pluck(:meters).count

elsif (session[:emp_start_date].present? and !session[:emp_end_date].present?)
  json.hour_lines Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  json.workdays_count ((emp_start_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  json.checklists_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).count

  json.checklists_engine_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(engine_oil: true).count
  json.checklists_hydraulic_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(hydraulic_oil: true).count
  json.checklists_gear_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(gear_oil: true).count
  json.checklists_breake_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(breake_oil: true).count
  json.checklists_battery_water_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(battery_water: true).count
  json.checklists_air_filter_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(air_filter: true).count
  json.checklists_fuel_water_separator_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fuel_water_separator: true).count
  json.checklists_fuel_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fuel_tank: true).count
  json.checklists_radiator_coolant_hoses_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(radiator_coolant_hoses: true).count
  json.checklists_lights_gauges_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(lights_gauges: true).count
  json.checklists_joints_pto_shaft_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(joints_pto_shaft: true).count
  json.checklists_chain_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(chain_tension: true).count
  json.checklists_tire_pressure_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(tire_pressure: true).count
  json.checklists_tire_bolt_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(tire_bolt: true).count
  json.checklists_fan_belt_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(fan_belt_tension: true).count
  json.checklists_air_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).where(air_tank: true).count

  json.checklists_hours_sum Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).sum(:hours)
  json.checklists_hours_average Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).average(:hours)

  json.checklists_meters_emp_start_date Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).min
  json.checklists_meters_emp_end_date Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).max
  json.checklists_meters_count Checklist.where(employee_id: params[:emp_id]).where(day: (emp_start_date)..(last_date)).pluck(:meters).count

elsif (!session[:emp_start_date].present? and session[:emp_end_date].present?)
  json.hour_lines Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).select(:day, :hours).group(:day, :hours).order(:day)

  json.workdays_count ((first_date)..(emp_end_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  json.checklists_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).count

  json.checklists_engine_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(engine_oil: true).count
  json.checklists_hydraulic_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(hydraulic_oil: true).count
  json.checklists_gear_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(gear_oil: true).count
  json.checklists_breake_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(breake_oil: true).count
  json.checklists_battery_water_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(battery_water: true).count
  json.checklists_air_filter_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(air_filter: true).count
  json.checklists_fuel_water_separator_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fuel_water_separator: true).count
  json.checklists_fuel_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fuel_tank: true).count
  json.checklists_radiator_coolant_hoses_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(radiator_coolant_hoses: true).count
  json.checklists_lights_gauges_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(lights_gauges: true).count
  json.checklists_joints_pto_shaft_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(joints_pto_shaft: true).count
  json.checklists_chain_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(chain_tension: true).count
  json.checklists_tire_pressure_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(tire_pressure: true).count
  json.checklists_tire_bolt_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(tire_bolt: true).count
  json.checklists_fan_belt_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(fan_belt_tension: true).count
  json.checklists_air_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).where(air_tank: true).count

  json.checklists_hours_sum Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).sum(:hours)
  json.checklists_hours_average Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).average(:hours)

  json.checklists_meters_emp_start_date Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).min
  json.checklists_meters_emp_end_date Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).max
  json.checklists_meters_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(emp_end_date)).pluck(:meters).count


elsif (!session[:emp_start_date].present? and !session[:emp_end_date].present? and Checklist.any?)
  json.hour_lines Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).select(:day, :hours).group(:day, :hours).order(:day)

  json.workdays_count ((first_date)..(last_date)).select { |date|  date.saturday? or date.sunday? or date.monday? or date.tuesday? or date.wednesday? or date.thursday?}.size
  json.checklists_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).count

  json.checklists_engine_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(engine_oil: true).count
  json.checklists_hydraulic_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(hydraulic_oil: true).count
  json.checklists_gear_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(gear_oil: true).count
  json.checklists_breake_oil_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(breake_oil: true).count
  json.checklists_battery_water_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(battery_water: true).count
  json.checklists_air_filter_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(air_filter: true).count
  json.checklists_fuel_water_separator_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fuel_water_separator: true).count
  json.checklists_fuel_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fuel_tank: true).count
  json.checklists_radiator_coolant_hoses_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(radiator_coolant_hoses: true).count
  json.checklists_lights_gauges_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(lights_gauges: true).count
  json.checklists_joints_pto_shaft_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(joints_pto_shaft: true).count
  json.checklists_chain_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(chain_tension: true).count
  json.checklists_tire_pressure_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(tire_pressure: true).count
  json.checklists_tire_bolt_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(tire_bolt: true).count
  json.checklists_fan_belt_tension_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(fan_belt_tension: true).count
  json.checklists_air_tank_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).where(air_tank: true).count

  json.checklists_hours_sum Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).sum(:hours)
  json.checklists_hours_average Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).average(:hours)

  json.checklists_meters_emp_start_date Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).min
  json.checklists_meters_emp_end_date Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).max
  json.checklists_meters_count Checklist.where(employee_id: params[:emp_id]).where(day: (first_date)..(last_date)).pluck(:meters).count


end
