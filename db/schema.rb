# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_05_035155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accident_assets", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.date "accident_asset_date", null: false
    t.text "accident_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id"], name: "index_accident_assets_on_data_asset_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "area_assets", force: :cascade do |t|
    t.string "area_asset_name", null: false
    t.boolean "area_asset_active", default: true
    t.text "area_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_asset_name"], name: "index_area_assets_on_area_asset_name", unique: true
  end

  create_table "area_pro_assets", force: :cascade do |t|
    t.string "area_pro_asset_name", null: false
    t.boolean "area_pro_asset_active", default: true
    t.text "area_pro_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_pro_asset_name"], name: "index_area_pro_assets_on_area_pro_asset_name", unique: true
  end

  create_table "asset_fueldays", force: :cascade do |t|
    t.bigint "tank_fuelday_id", null: false
    t.bigint "data_asset_id", null: false
    t.integer "quantity", default: 0
    t.date "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id", "day"], name: "index_asset_fueldays_on_data_asset_id_and_day", unique: true
    t.index ["data_asset_id"], name: "index_asset_fueldays_on_data_asset_id"
    t.index ["tank_fuelday_id"], name: "index_asset_fueldays_on_tank_fuelday_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id", "role_id"], name: "index_assignments_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "breakdown_spares", force: :cascade do |t|
    t.bigint "repair_breakdown_id", null: false
    t.bigint "matrial_request_id"
    t.bigint "purchase_request_id"
    t.string "spare_part_number"
    t.text "spare_description"
    t.integer "spare_quantity", default: 1
    t.integer "available_spare_quantity"
    t.integer "approved_spare_quantity"
    t.integer "willpurchase_spare_quantity"
    t.integer "purchased_spare_quantity"
    t.integer "replacement_code"
    t.integer "spare_status", default: 0
    t.text "refuse_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matrial_request_id"], name: "index_breakdown_spares_on_matrial_request_id"
    t.index ["purchase_request_id"], name: "index_breakdown_spares_on_purchase_request_id"
    t.index ["repair_breakdown_id"], name: "index_breakdown_spares_on_repair_breakdown_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.bigint "user_id", null: false
    t.bigint "supervisor_id"
    t.bigint "employee_id"
    t.bigint "site_asset_id"
    t.date "day", null: false
    t.boolean "engine_oil", default: false
    t.boolean "hydraulic_oil", default: false
    t.boolean "gear_oil", default: false
    t.boolean "breake_oil", default: false
    t.boolean "battery_water", default: false
    t.boolean "air_filter", default: false
    t.boolean "fuel_water_separator", default: false
    t.boolean "fuel_tank", default: false
    t.boolean "radiator_coolant_hoses", default: false
    t.boolean "lights_gauges", default: false
    t.boolean "joints_pto_shaft", default: false
    t.boolean "chain_tension", default: false
    t.boolean "tire_pressure", default: false
    t.boolean "tire_bolt", default: false
    t.boolean "fan_belt_tension", default: false
    t.boolean "air_tank", default: false
    t.integer "hours", default: 0
    t.integer "meters", default: 0
    t.text "notes"
    t.boolean "wrong_site"
    t.boolean "wrong_employee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id", "day"], name: "index_checklists_on_data_asset_id_and_day", unique: true
    t.index ["data_asset_id"], name: "index_checklists_on_data_asset_id"
    t.index ["employee_id"], name: "index_checklists_on_employee_id"
    t.index ["site_asset_id"], name: "index_checklists_on_site_asset_id"
    t.index ["supervisor_id"], name: "index_checklists_on_supervisor_id"
    t.index ["user_id"], name: "index_checklists_on_user_id"
  end

  create_table "color_assets", force: :cascade do |t|
    t.string "color_asset_name", null: false
    t.boolean "color_asset_active", default: true
    t.text "color_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_asset_name"], name: "index_color_assets_on_color_asset_name", unique: true
  end

  create_table "data_assets", force: :cascade do |t|
    t.string "data_asset_serial", null: false
    t.bigint "type_asset_id", null: false
    t.bigint "model_asset_id"
    t.date "data_asset_arrived_date"
    t.string "data_asset_plate_no"
    t.string "data_asset_chassis_no"
    t.string "data_asset_arrangement_no"
    t.string "data_asset_manufacture_year"
    t.bigint "color_asset_id"
    t.string "data_asset_warranty"
    t.string "data_asset_madein"
    t.string "data_asset_purchasefrom"
    t.string "data_asset_invoice_no"
    t.integer "status_before_repaire"
    t.bigint "status_asset_id"
    t.bigint "province_asset_id", null: false
    t.bigint "site_asset_id", null: false
    t.bigint "employee_id"
    t.boolean "data_asset_in_use", default: true
    t.bigint "user_id", null: false
    t.boolean "data_asset_active", default: true
    t.text "data_asset_current_condition"
    t.text "data_asset_remarks"
    t.string "data_asset_acquisition_value"
    t.date "data_asset_acquisition_date"
    t.string "data_asset_book_value"
    t.string "data_asset_engine_model_1"
    t.string "data_asset_engine_serial_no_1"
    t.string "data_asset_engine_family_1"
    t.string "data_asset_engine_arrangement_1"
    t.string "data_asset_engine_displacement_no_1"
    t.string "data_asset_engine_rating_1"
    t.string "data_asset_engine_code_1"
    t.string "data_asset_engine_model_2"
    t.string "data_asset_engine_serial_2"
    t.string "data_asset_engine_family_2"
    t.string "data_asset_engine_arrangement_2"
    t.string "data_asset_engine_displacement_no_2"
    t.string "data_asset_engine_rating_2"
    t.string "data_asset_engine_code_2"
    t.string "data_asset_transmission_model"
    t.string "data_asset_transmission_serial_no"
    t.string "data_asset_transmission_arrangement"
    t.string "data_asset_concrete_mixer_name"
    t.string "data_asset_concrete_mixer_model"
    t.string "data_asset_concrete_mixer_serial_no"
    t.string "data_asset_concrete_mixer_capacity"
    t.string "data_asset_concrete_pump_name"
    t.string "data_asset_concrete_pump_model"
    t.string "data_asset_concrete_pump_serial_no"
    t.string "data_asset_generator_no"
    t.string "data_asset_generator_controller_no"
    t.string "data_asset_generator_governor_no"
    t.string "data_asset_generator_alternator_no"
    t.string "data_asset_generator_alternator_model"
    t.string "data_asset_generator_alternator_serial_no"
    t.string "data_asset_generator_rated_voltage"
    t.string "data_asset_generator_phase"
    t.string "data_asset_generator_rated_frequency"
    t.string "data_asset_generator_rated_current_prime"
    t.string "data_asset_generator_rated_rpm"
    t.string "data_asset_generator_altitude"
    t.string "data_asset_generator_rated_power"
    t.string "data_asset_generator_manufacture_year"
    t.string "data_asset_generator_madein"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_asset_id"], name: "index_data_assets_on_color_asset_id"
    t.index ["data_asset_serial"], name: "index_data_assets_on_data_asset_serial", unique: true
    t.index ["deleted_at"], name: "index_data_assets_on_deleted_at"
    t.index ["employee_id"], name: "index_data_assets_on_employee_id"
    t.index ["model_asset_id"], name: "index_data_assets_on_model_asset_id"
    t.index ["province_asset_id"], name: "index_data_assets_on_province_asset_id"
    t.index ["site_asset_id"], name: "index_data_assets_on_site_asset_id"
    t.index ["status_asset_id"], name: "index_data_assets_on_status_asset_id"
    t.index ["type_asset_id"], name: "index_data_assets_on_type_asset_id"
    t.index ["user_id"], name: "index_data_assets_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "employee_number", null: false
    t.string "employee_name", null: false
    t.string "employee_mobile"
    t.boolean "employee_active", default: true
    t.text "employee_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_name"], name: "index_employees_on_employee_name", unique: true
    t.index ["employee_number"], name: "index_employees_on_employee_number", unique: true
  end

  create_table "matrial_requests", force: :cascade do |t|
    t.bigint "repair_order_id", null: false
    t.bigint "area_asset_id", null: false
    t.bigint "user_id", null: false
    t.boolean "store_done", default: false
    t.datetime "store_done_date"
    t.boolean "manager_done", default: false
    t.datetime "manager_done_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_asset_id"], name: "index_matrial_requests_on_area_asset_id"
    t.index ["repair_order_id"], name: "index_matrial_requests_on_repair_order_id"
    t.index ["user_id"], name: "index_matrial_requests_on_user_id"
  end

  create_table "model_assets", force: :cascade do |t|
    t.string "model_asset_name", null: false
    t.boolean "model_asset_active", default: true
    t.text "model_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_asset_name"], name: "index_model_assets_on_model_asset_name", unique: true
  end

  create_table "model_assets_type_assets", id: false, force: :cascade do |t|
    t.bigint "model_asset_id", null: false
    t.bigint "type_asset_id", null: false
    t.index ["model_asset_id", "type_asset_id"], name: "index_model_assets_type_assets", unique: true
  end

  create_table "pro_asphalt_products", force: :cascade do |t|
    t.string "pro_asphalt_product_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_asphalt_product_name"], name: "index_pro_asphalt_products_on_pro_asphalt_product_name", unique: true
  end

  create_table "pro_asphalt_subs", force: :cascade do |t|
    t.bigint "pro_asphalt_id", null: false
    t.bigint "pro_asphalt_type_id", null: false
    t.bigint "pro_asphalt_product_id", null: false
    t.integer "pro_asphalt_amount", null: false
    t.bigint "pro_reason_id"
    t.text "pro_asphalt_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_asphalt_id"], name: "index_pro_asphalt_subs_on_pro_asphalt_id"
    t.index ["pro_asphalt_product_id"], name: "index_pro_asphalt_subs_on_pro_asphalt_product_id"
    t.index ["pro_asphalt_type_id"], name: "index_pro_asphalt_subs_on_pro_asphalt_type_id"
    t.index ["pro_reason_id"], name: "index_pro_asphalt_subs_on_pro_reason_id"
  end

  create_table "pro_asphalt_types", force: :cascade do |t|
    t.string "pro_asphalt_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_asphalt_type_name"], name: "index_pro_asphalt_types_on_pro_asphalt_type_name", unique: true
  end

  create_table "pro_asphalts", force: :cascade do |t|
    t.bigint "province_pro_asset_id", null: false
    t.date "day", null: false
    t.integer "pro_asphalt_hours", default: 0, null: false
    t.integer "pro_asphalt_machines_num", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_pro_asset_id", "day"], name: "index_pro_asphalts_on_province_pro_asset_id_and_day", unique: true
    t.index ["province_pro_asset_id"], name: "index_pro_asphalts_on_province_pro_asset_id"
  end

  create_table "pro_concrete_products", force: :cascade do |t|
    t.string "pro_concrete_product_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_concrete_product_name"], name: "index_pro_concrete_products_on_pro_concrete_product_name", unique: true
  end

  create_table "pro_concrete_subs", force: :cascade do |t|
    t.bigint "pro_concrete_id", null: false
    t.bigint "pro_concrete_type_id", null: false
    t.bigint "pro_concrete_product_id", null: false
    t.integer "pro_concrete_amount", null: false
    t.bigint "pro_reason_id"
    t.text "pro_concrete_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_concrete_id"], name: "index_pro_concrete_subs_on_pro_concrete_id"
    t.index ["pro_concrete_product_id"], name: "index_pro_concrete_subs_on_pro_concrete_product_id"
    t.index ["pro_concrete_type_id"], name: "index_pro_concrete_subs_on_pro_concrete_type_id"
    t.index ["pro_reason_id"], name: "index_pro_concrete_subs_on_pro_reason_id"
  end

  create_table "pro_concrete_types", force: :cascade do |t|
    t.string "pro_concrete_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_concrete_type_name"], name: "index_pro_concrete_types_on_pro_concrete_type_name", unique: true
  end

  create_table "pro_concretes", force: :cascade do |t|
    t.bigint "province_pro_asset_id", null: false
    t.date "day", null: false
    t.integer "pro_concrete_hours", default: 0, null: false
    t.integer "pro_concrete_machines_num", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_pro_asset_id", "day"], name: "index_pro_concretes_on_province_pro_asset_id_and_day", unique: true
    t.index ["province_pro_asset_id"], name: "index_pro_concretes_on_province_pro_asset_id"
  end

  create_table "pro_crusher_subs", force: :cascade do |t|
    t.bigint "pro_crusher_id", null: false
    t.bigint "pro_crusher_type_id", null: false
    t.integer "measurement", null: false
    t.integer "pro_crusher_amount", null: false
    t.integer "pro_crusher_amount_meters", null: false
    t.bigint "pro_reason_id"
    t.text "pro_crusher_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_crusher_id"], name: "index_pro_crusher_subs_on_pro_crusher_id"
    t.index ["pro_crusher_type_id"], name: "index_pro_crusher_subs_on_pro_crusher_type_id"
    t.index ["pro_reason_id"], name: "index_pro_crusher_subs_on_pro_reason_id"
  end

  create_table "pro_crusher_types", force: :cascade do |t|
    t.string "pro_crusher_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_crusher_type_name"], name: "index_pro_crusher_types_on_pro_crusher_type_name", unique: true
  end

  create_table "pro_crushers", force: :cascade do |t|
    t.bigint "province_pro_asset_id", null: false
    t.date "day", null: false
    t.integer "pro_crusher_hours", default: 0, null: false
    t.integer "pro_crusher_machines_num", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_pro_asset_id", "day"], name: "index_pro_crushers_on_province_pro_asset_id_and_day", unique: true
    t.index ["province_pro_asset_id"], name: "index_pro_crushers_on_province_pro_asset_id"
  end

  create_table "pro_reasons", force: :cascade do |t|
    t.string "pro_reason_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pro_reason_name"], name: "index_pro_reasons_on_pro_reason_name", unique: true
  end

  create_table "province_assets", force: :cascade do |t|
    t.string "province_asset_name", null: false
    t.bigint "area_asset_id", null: false
    t.bigint "user_id", null: false
    t.boolean "province_asset_active", default: true
    t.text "province_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_asset_id"], name: "index_province_assets_on_area_asset_id"
    t.index ["province_asset_name"], name: "index_province_assets_on_province_asset_name", unique: true
    t.index ["user_id"], name: "index_province_assets_on_user_id"
  end

  create_table "province_pro_assets", force: :cascade do |t|
    t.string "province_pro_asset_name", null: false
    t.bigint "area_pro_asset_id", null: false
    t.bigint "user_id", null: false
    t.boolean "concrete", default: true
    t.boolean "asphalt", default: true
    t.boolean "crusher", default: true
    t.boolean "province_pro_asset_active", default: true
    t.text "province_pro_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_pro_asset_id"], name: "index_province_pro_assets_on_area_pro_asset_id"
    t.index ["province_pro_asset_name"], name: "index_province_pro_assets_on_province_pro_asset_name", unique: true
    t.index ["user_id"], name: "index_province_pro_assets_on_user_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.bigint "matrial_request_id", null: false
    t.boolean "request_purchase_done", default: false
    t.datetime "request_purchase_done_date"
    t.boolean "purchase_done", default: false
    t.datetime "purchase_done_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matrial_request_id"], name: "index_purchase_requests_on_matrial_request_id"
  end

  create_table "repair_breakdowns", force: :cascade do |t|
    t.bigint "repair_order_id"
    t.string "repair_breakdown_name", null: false
    t.integer "breakdown_status", default: 0
    t.text "repair_breakdown_description"
    t.date "repair_breakdown_test_date"
    t.string "repair_breakdown_technician_name"
    t.string "repair_breakdown_test_result"
    t.bigint "employee_id"
    t.date "repair_breakdown_after_repair_test_date"
    t.text "repair_breakdown_after_repair_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_repair_breakdowns_on_employee_id"
    t.index ["repair_order_id"], name: "index_repair_breakdowns_on_repair_order_id"
  end

  create_table "repair_orders", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.bigint "user_id", null: false
    t.bigint "site_asset_id", null: false
    t.bigint "employee_id"
    t.date "transfer_date"
    t.time "transfer_time"
    t.bigint "site_user_id"
    t.bigint "province_user_id"
    t.integer "repair_status", default: 0
    t.bigint "workshop_site_id"
    t.bigint "workshop_site_user_id"
    t.boolean "delivery_done", default: false
    t.datetime "workshop_site_action_date"
    t.boolean "workshop_ignition_switch", default: false
    t.boolean "workshop_equipment_card", default: false
    t.boolean "workshop_driver_card", default: false
    t.boolean "workshop_maintenance_card", default: false
    t.text "workshop_site_repair_note"
    t.datetime "workshop_site_repair_date"
    t.boolean "workshop_site_repair_done", default: false
    t.boolean "return_done", default: false
    t.datetime "return_site_action_date"
    t.boolean "return_ignition_switch", default: false
    t.boolean "return_equipment_card", default: false
    t.boolean "return_driver_card", default: false
    t.boolean "return_maintenance_card", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id"], name: "index_repair_orders_on_data_asset_id"
    t.index ["employee_id"], name: "index_repair_orders_on_employee_id"
    t.index ["province_user_id"], name: "index_repair_orders_on_province_user_id"
    t.index ["site_asset_id"], name: "index_repair_orders_on_site_asset_id"
    t.index ["site_user_id"], name: "index_repair_orders_on_site_user_id"
    t.index ["user_id"], name: "index_repair_orders_on_user_id"
    t.index ["workshop_site_id"], name: "index_repair_orders_on_workshop_site_id"
    t.index ["workshop_site_user_id"], name: "index_repair_orders_on_workshop_site_user_id"
  end

  create_table "request_assets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "user_type", default: 0
    t.bigint "type_asset_id", null: false
    t.bigint "province_asset_to_id", null: false
    t.bigint "site_asset_to_id", null: false
    t.boolean "driver_request", default: false
    t.text "request_reason", null: false
    t.text "work_type", null: false
    t.date "need_date", null: false
    t.integer "need_days", null: false
    t.integer "request_status", default: 0
    t.bigint "site_user_id"
    t.bigint "province_user_id"
    t.datetime "province_user_action_date"
    t.bigint "transfer_dep_user_id"
    t.datetime "transfer_dep_action_date"
    t.text "refuse_reason"
    t.integer "accept_status"
    t.integer "available_after_days"
    t.date "available_date"
    t.boolean "ready_done", default: false
    t.datetime "ready_dep_action_date"
    t.date "ready_date"
    t.bigint "data_asset_if_ours_id"
    t.bigint "data_asset_lowbed_id"
    t.boolean "receive_done", default: false
    t.datetime "receive_site_action_date"
    t.boolean "receive_transfer_driver_form", default: false
    t.boolean "receive_repair_order", default: false
    t.boolean "receive_accident_report", default: false
    t.boolean "receive_maintenance_card", default: false
    t.boolean "receive_car_license", default: false
    t.boolean "receive_operation_card", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_if_ours_id"], name: "index_request_assets_on_data_asset_if_ours_id"
    t.index ["data_asset_lowbed_id"], name: "index_request_assets_on_data_asset_lowbed_id"
    t.index ["province_asset_to_id"], name: "index_request_assets_on_province_asset_to_id"
    t.index ["province_user_id"], name: "index_request_assets_on_province_user_id"
    t.index ["site_asset_to_id"], name: "index_request_assets_on_site_asset_to_id"
    t.index ["site_user_id"], name: "index_request_assets_on_site_user_id"
    t.index ["transfer_dep_user_id"], name: "index_request_assets_on_transfer_dep_user_id"
    t.index ["type_asset_id"], name: "index_request_assets_on_type_asset_id"
    t.index ["user_id"], name: "index_request_assets_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name", null: false
    t.boolean "role_active", default: true
    t.text "role_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_name"], name: "index_roles_on_role_name", unique: true
  end

  create_table "site_assets", force: :cascade do |t|
    t.string "site_asset_name", null: false
    t.bigint "province_asset_id", null: false
    t.bigint "user_id", null: false
    t.boolean "site_asset_active", default: true
    t.text "site_asset_remarks"
    t.integer "site_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_asset_id"], name: "index_site_assets_on_province_asset_id"
    t.index ["site_asset_name"], name: "index_site_assets_on_site_asset_name", unique: true
    t.index ["user_id"], name: "index_site_assets_on_user_id"
  end

  create_table "status_assets", force: :cascade do |t|
    t.string "status_asset_name", null: false
    t.boolean "status_asset_active", default: true
    t.text "status_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_asset_name"], name: "index_status_assets_on_status_asset_name", unique: true
  end

  create_table "tank_fueldays", force: :cascade do |t|
    t.date "day", null: false
    t.bigint "data_asset_id", null: false
    t.bigint "user_id", null: false
    t.bigint "employee_id"
    t.bigint "site_asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id", "day"], name: "index_tank_fueldays_on_data_asset_id_and_day", unique: true
    t.index ["data_asset_id"], name: "index_tank_fueldays_on_data_asset_id"
    t.index ["employee_id"], name: "index_tank_fueldays_on_employee_id"
    t.index ["site_asset_id"], name: "index_tank_fueldays_on_site_asset_id"
    t.index ["user_id"], name: "index_tank_fueldays_on_user_id"
  end

  create_table "transfer_assets", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.bigint "user_id", null: false
    t.integer "user_type", default: 0
    t.text "transfer_reason"
    t.text "refuse_reason"
    t.boolean "transfer_asset_active", default: true
    t.bigint "site_asset_from_id", null: false
    t.bigint "province_asset_from_id", null: false
    t.bigint "site_asset_to_id", null: false
    t.bigint "province_asset_to_id", null: false
    t.integer "transfer_status", default: 0
    t.bigint "transfer_dep_user_id"
    t.datetime "transfer_dep_action_date"
    t.date "transfer_date"
    t.bigint "data_asset_lowbed_id"
    t.boolean "delivery_done", default: false
    t.bigint "delivery_site_user_id"
    t.bigint "delivery_province_user_id"
    t.datetime "delivery_site_action_date"
    t.boolean "delivery_transfer_driver_form", default: false
    t.boolean "delivery_repair_order", default: false
    t.boolean "delivery_accident_report", default: false
    t.boolean "delivery_maintenance_card", default: false
    t.boolean "delivery_car_license", default: false
    t.boolean "delivery_operation_card", default: false
    t.boolean "receive_done", default: false
    t.bigint "receive_site_user_id"
    t.bigint "receive_province_user_id"
    t.datetime "receive_site_action_date"
    t.boolean "receive_transfer_driver_form", default: false
    t.boolean "receive_repair_order", default: false
    t.boolean "receive_accident_report", default: false
    t.boolean "receive_maintenance_card", default: false
    t.boolean "receive_car_license", default: false
    t.boolean "receive_operation_card", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id"], name: "index_transfer_assets_on_data_asset_id"
    t.index ["data_asset_lowbed_id"], name: "index_transfer_assets_on_data_asset_lowbed_id"
    t.index ["delivery_province_user_id"], name: "index_transfer_assets_on_delivery_province_user_id"
    t.index ["delivery_site_user_id"], name: "index_transfer_assets_on_delivery_site_user_id"
    t.index ["province_asset_from_id"], name: "index_transfer_assets_on_province_asset_from_id"
    t.index ["province_asset_to_id"], name: "index_transfer_assets_on_province_asset_to_id"
    t.index ["receive_province_user_id"], name: "index_transfer_assets_on_receive_province_user_id"
    t.index ["receive_site_user_id"], name: "index_transfer_assets_on_receive_site_user_id"
    t.index ["site_asset_from_id"], name: "index_transfer_assets_on_site_asset_from_id"
    t.index ["site_asset_to_id"], name: "index_transfer_assets_on_site_asset_to_id"
    t.index ["transfer_dep_user_id"], name: "index_transfer_assets_on_transfer_dep_user_id"
    t.index ["user_id"], name: "index_transfer_assets_on_user_id"
  end

  create_table "type_assets", force: :cascade do |t|
    t.string "type_asset_name", null: false
    t.boolean "type_asset_active", default: true
    t.text "type_asset_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_asset_name"], name: "index_type_assets_on_type_asset_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "withdraw_assets", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.bigint "user_id", null: false
    t.text "withdraw_reason"
    t.text "withdraw_procedure"
    t.bigint "site_asset_from_id", null: false
    t.bigint "province_asset_from_id", null: false
    t.bigint "site_asset_to_id", null: false
    t.bigint "province_asset_to_id", null: false
    t.integer "withdraw_status", default: 0
    t.date "transfer_date"
    t.bigint "data_asset_lowbed_id"
    t.boolean "delivery_done", default: false
    t.bigint "delivery_site_user_id"
    t.bigint "delivery_province_user_id"
    t.date "delivery_site_action_date"
    t.boolean "delivery_transfer_driver_form", default: false
    t.boolean "delivery_repair_order", default: false
    t.boolean "delivery_accident_report", default: false
    t.boolean "delivery_maintenance_card", default: false
    t.boolean "delivery_car_license", default: false
    t.boolean "delivery_operation_card", default: false
    t.boolean "receive_done", default: false
    t.bigint "receive_site_user_id"
    t.bigint "receive_province_user_id"
    t.datetime "receive_site_action_date"
    t.boolean "receive_transfer_driver_form", default: false
    t.boolean "receive_repair_order", default: false
    t.boolean "receive_accident_report", default: false
    t.boolean "receive_maintenance_card", default: false
    t.boolean "receive_car_license", default: false
    t.boolean "receive_operation_card", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_asset_id"], name: "index_withdraw_assets_on_data_asset_id"
    t.index ["data_asset_lowbed_id"], name: "index_withdraw_assets_on_data_asset_lowbed_id"
    t.index ["delivery_province_user_id"], name: "index_withdraw_assets_on_delivery_province_user_id"
    t.index ["delivery_site_user_id"], name: "index_withdraw_assets_on_delivery_site_user_id"
    t.index ["province_asset_from_id"], name: "index_withdraw_assets_on_province_asset_from_id"
    t.index ["province_asset_to_id"], name: "index_withdraw_assets_on_province_asset_to_id"
    t.index ["receive_province_user_id"], name: "index_withdraw_assets_on_receive_province_user_id"
    t.index ["receive_site_user_id"], name: "index_withdraw_assets_on_receive_site_user_id"
    t.index ["site_asset_from_id"], name: "index_withdraw_assets_on_site_asset_from_id"
    t.index ["site_asset_to_id"], name: "index_withdraw_assets_on_site_asset_to_id"
    t.index ["user_id"], name: "index_withdraw_assets_on_user_id"
  end

  create_table "wrong_data_assets", force: :cascade do |t|
    t.bigint "data_asset_id", null: false
    t.bigint "checklist_id", null: false
    t.bigint "employee_now_id"
    t.bigint "employee_should_id"
    t.bigint "site_now_id"
    t.bigint "site_should_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_wrong_data_assets_on_checklist_id"
    t.index ["data_asset_id"], name: "index_wrong_data_assets_on_data_asset_id"
    t.index ["employee_now_id"], name: "index_wrong_data_assets_on_employee_now_id"
    t.index ["employee_should_id"], name: "index_wrong_data_assets_on_employee_should_id"
    t.index ["site_now_id"], name: "index_wrong_data_assets_on_site_now_id"
    t.index ["site_should_id"], name: "index_wrong_data_assets_on_site_should_id"
  end

  add_foreign_key "accident_assets", "data_assets"
  add_foreign_key "asset_fueldays", "data_assets"
  add_foreign_key "asset_fueldays", "tank_fueldays"
  add_foreign_key "assignments", "employees"
  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "breakdown_spares", "matrial_requests"
  add_foreign_key "breakdown_spares", "purchase_requests"
  add_foreign_key "breakdown_spares", "repair_breakdowns"
  add_foreign_key "checklists", "data_assets"
  add_foreign_key "checklists", "employees"
  add_foreign_key "checklists", "site_assets"
  add_foreign_key "checklists", "users"
  add_foreign_key "data_assets", "color_assets"
  add_foreign_key "data_assets", "employees"
  add_foreign_key "data_assets", "model_assets"
  add_foreign_key "data_assets", "province_assets"
  add_foreign_key "data_assets", "site_assets"
  add_foreign_key "data_assets", "status_assets"
  add_foreign_key "data_assets", "type_assets"
  add_foreign_key "data_assets", "users"
  add_foreign_key "matrial_requests", "area_assets"
  add_foreign_key "matrial_requests", "repair_orders"
  add_foreign_key "matrial_requests", "users"
  add_foreign_key "pro_asphalt_subs", "pro_asphalt_products"
  add_foreign_key "pro_asphalt_subs", "pro_asphalt_types"
  add_foreign_key "pro_asphalt_subs", "pro_asphalts"
  add_foreign_key "pro_asphalt_subs", "pro_reasons"
  add_foreign_key "pro_asphalts", "province_pro_assets"
  add_foreign_key "pro_concrete_subs", "pro_concrete_products"
  add_foreign_key "pro_concrete_subs", "pro_concrete_types"
  add_foreign_key "pro_concrete_subs", "pro_concretes"
  add_foreign_key "pro_concrete_subs", "pro_reasons"
  add_foreign_key "pro_concretes", "province_pro_assets"
  add_foreign_key "pro_crusher_subs", "pro_crusher_types"
  add_foreign_key "pro_crusher_subs", "pro_crushers"
  add_foreign_key "pro_crusher_subs", "pro_reasons"
  add_foreign_key "pro_crushers", "province_pro_assets"
  add_foreign_key "province_assets", "area_assets"
  add_foreign_key "province_assets", "users"
  add_foreign_key "province_pro_assets", "area_pro_assets"
  add_foreign_key "province_pro_assets", "users"
  add_foreign_key "purchase_requests", "matrial_requests"
  add_foreign_key "repair_breakdowns", "employees"
  add_foreign_key "repair_breakdowns", "repair_orders"
  add_foreign_key "repair_orders", "data_assets"
  add_foreign_key "repair_orders", "employees"
  add_foreign_key "repair_orders", "site_assets"
  add_foreign_key "repair_orders", "users"
  add_foreign_key "request_assets", "type_assets"
  add_foreign_key "request_assets", "users"
  add_foreign_key "site_assets", "province_assets"
  add_foreign_key "site_assets", "users"
  add_foreign_key "tank_fueldays", "data_assets"
  add_foreign_key "tank_fueldays", "employees"
  add_foreign_key "tank_fueldays", "site_assets"
  add_foreign_key "tank_fueldays", "users"
  add_foreign_key "transfer_assets", "data_assets"
  add_foreign_key "transfer_assets", "users"
  add_foreign_key "withdraw_assets", "data_assets"
  add_foreign_key "withdraw_assets", "users"
  add_foreign_key "wrong_data_assets", "checklists"
  add_foreign_key "wrong_data_assets", "data_assets"
end
