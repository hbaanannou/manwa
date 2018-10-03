class ProvinceProAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_province_pro_asset, only: [:show, :edit, :update, :destroy]

  # GET /province_pro_assets
  # GET /province_pro_assets.json
  def index
    @q = ProvinceProAsset.includes(:area_pro_asset, :user).ransack(params[:q])
    @province_pro_assets = policy_scope(@q.result.order(province_pro_asset_name: :asc).paginate(:page => params[:page], :per_page => 20))
  end

  # GET /province_pro_assets/1
  # GET /province_pro_assets/1.json
  def show
  end

  # GET /province_pro_assets/new
  def new
    @province_pro_asset = ProvinceProAsset.new
  end

  # GET /province_pro_assets/1/edit
  def edit
  end

  # POST /province_pro_assets
  # POST /province_pro_assets.json
  def create
    @province_pro_asset = ProvinceProAsset.new(province_pro_asset_params)

    respond_to do |format|
      if @province_pro_asset.save
        format.html { redirect_to @province_pro_asset, notice: 'Province pro asset was successfully created.' }
        format.json { render :show, status: :created, location: @province_pro_asset }
      else
        format.html { render :new }
        format.json { render json: @province_pro_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /province_pro_assets/1
  # PATCH/PUT /province_pro_assets/1.json
  def update
    respond_to do |format|
      if @province_pro_asset.update(province_pro_asset_params)
        format.html { redirect_to @province_pro_asset, notice: 'Province pro asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @province_pro_asset }
      else
        format.html { render :edit }
        format.json { render json: @province_pro_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /province_pro_assets/1
  # DELETE /province_pro_assets/1.json
  def destroy
    @province_pro_asset.destroy
    respond_to do |format|
      format.html { redirect_to province_pro_assets_url, notice: 'Province pro asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def province_pro
    respond_to do |format|
      format.html
      format.js
    end
  end

  def con_province_pro_lines

    if params[:start_date].present?
      session[:start_date] = params[:start_date]
    elsif params[:end_date].present?
      session[:end_date] = params[:end_date]
    elsif params[:start_date].nil? and params[:end_date].nil?
      session[:start_date] = nil
      session[:end_date] = nil
    end


    if params[:con_chart_display].present?
      session[:con_chart_display] = params[:con_chart_display]
    else
      session[:con_chart_display] = nil
    end

    respond_to do |format|
      format.json
      format.js
    end

  end


  def con_province_pro_details


if session[:start_date].present?
start_date = session[:start_date].to_date
end

if session[:end_date].present?
end_date = session[:end_date].to_date
end

from_60 = ProConcrete.pluck(:day).max - 60 if ProConcrete.any?
first_date = ProConcrete.where(" day > ? ", from_60).any? ? ProConcrete.where(" day > ? ", from_60).pluck(:day).min : ProConcrete.pluck(:day).min
last_date = ProConcrete.pluck(:day).max

if (session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_concretes).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concretes.pro_concrete_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_200_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_200_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_250_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_250_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_280_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_280_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_300_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_300_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_350_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_350_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_375_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_375_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_400_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_400_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_420_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_420_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_425_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_425_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_440_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_440_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_450_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_450_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_475_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_475_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

elsif (session[:start_date].present? and !session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_concretes).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concretes.pro_concrete_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_200_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_200_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_250_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_250_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_280_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_280_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_300_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_300_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_350_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_350_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_375_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_375_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_400_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_400_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_420_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_420_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_425_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_425_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_440_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_440_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_450_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_450_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_475_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_475_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')
elsif (!session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = first_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_concretes).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concretes.pro_concrete_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_200_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_200_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_250_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_250_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_280_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_280_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_300_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_300_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_350_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_350_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_375_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_375_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_400_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_400_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_420_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_420_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_425_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_425_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_440_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_440_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_450_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_450_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_475_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_475_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')
elsif (!session[:start_date].present? and !session[:end_date].present? and ProConcrete.any?)
  @pdf_from_date = first_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_concretes).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concretes.pro_concrete_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_200_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_200_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 1 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_250_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_250_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 2 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_280_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_280_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 3 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_300_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_300_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 4 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_350_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_350_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 5 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_375_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_375_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 6 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_400_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_400_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 7 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_420_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_420_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 8 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_425_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_425_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 9 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_440_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_440_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 10 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_450_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_450_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 11 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')

  @province_475_normal_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 1').sum(:'pro_concrete_subs.pro_concrete_amount')
  @province_475_resistant_amount_sum = ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_concrete_subs.pro_concrete_type_id = 12 and pro_concrete_subs.pro_concrete_product_id = 2').sum(:'pro_concrete_subs.pro_concrete_amount')
end


    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "productions", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end


  def con_province_pro_details_lines

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



  def asph_province_pro_lines

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


  def asph_province_pro_details


    if session[:start_date].present?
start_date = session[:start_date].to_date
end

if session[:end_date].present?
end_date = session[:end_date].to_date
end

from_60 = ProAsphalt.pluck(:day).max - 60 if ProAsphalt.any?
first_date = ProAsphalt.where(" day > ? ", from_60).any? ? ProAsphalt.where(" day > ? ", from_60).pluck(:day).min : ProAsphalt.pluck(:day).min
last_date = ProAsphalt.pluck(:day).max

if (session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_asphalts).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalts.pro_asphalt_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_base_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_wearing_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')

elsif (session[:start_date].present? and !session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_asphalts).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalts.pro_asphalt_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_base_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_wearing_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')

elsif (!session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = first_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_asphalts).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalts.pro_asphalt_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_base_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_wearing_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')

elsif (!session[:start_date].present? and !session[:end_date].present? and ProAsphalt.any?)
  @pdf_from_date = first_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_asphalts).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalts.pro_asphalt_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_base_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_base_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 1 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_70_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 1').sum(:'pro_asphalt_subs.pro_asphalt_amount')

  @province_wearing_76_10_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 2').sum(:'pro_asphalt_subs.pro_asphalt_amount')
  @province_wearing_60_70_amount_sum = ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_asphalt_subs.pro_asphalt_type_id = 2 and pro_asphalt_subs.pro_asphalt_product_id = 3').sum(:'pro_asphalt_subs.pro_asphalt_amount')

end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "productions", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end

  def asph_province_pro_details_lines

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



  def cru_province_pro_lines

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


  def cru_province_pro_details

    if session[:start_date].present?
start_date = session[:start_date].to_date
end

if session[:end_date].present?
end_date = session[:end_date].to_date
end

from_60 = ProCrusher.pluck(:day).max - 60 if ProCrusher.any?
first_date = ProCrusher.where(" day > ? ", from_60).any? ? ProCrusher.where(" day > ? ", from_60).pluck(:day).min : ProCrusher.pluck(:day).min
last_date = ProCrusher.pluck(:day).max

if (session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_3_8_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_3_4_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_1_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_11_2_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_oversize_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_aggregate_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (session[:start_date].present? and !session[:end_date].present?)
  @pdf_from_date = start_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_3_8_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_3_4_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_1_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_11_2_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_oversize_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_aggregate_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (!session[:start_date].present? and session[:end_date].present?)
  @pdf_from_date = first_date
  @pdf_to_date = end_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_3_8_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_3_4_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_1_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_11_2_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_oversize_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_aggregate_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (!session[:start_date].present? and !session[:end_date].present? and ProCrusher.any?)
  @pdf_from_date = first_date
  @pdf_to_date = last_date
  @province_hours_sum = ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
  @province_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_3_8_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_3_4_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_1_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_11_2_in_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

  @province_oversize_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
  @province_aggregate_amount_sum = ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "productions", layout: "pdf/pdf_layout", header: { right: '[page] of [topage]' }
      end
    end
  end


  def cru_province_pro_details_lines

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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province_pro_asset
      @province_pro_asset = ProvinceProAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def province_pro_asset_params
      params.require(:province_pro_asset).permit(:province_pro_asset_name, :area_pro_asset_id, :user_id, :concrete, :asphalt, :crusher)
    end
end
