class PagesController < ApplicationController
	before_action :authenticate_user!

  def home

  	if current_user.role?(:store)
  		redirect_to breakdown_spares_path
    elsif current_user.role?(:rfuel) || current_user.role?(:tfuel)
      redirect_to new_tank_fuelday_path
    elsif current_user.role?(:rchecklist) || current_user.role?(:tchecklist)
      redirect_to new_checklist_path
    elsif current_user.role?(:rstore) || current_user.role?(:tstore)
      redirect_to matrial_requests_path
    elsif current_user.role?(:purchase)
      redirect_to purchase_requests_path
    elsif current_user.role?(:production_province)
      if policy_scope(ProvinceProAsset.where(concrete: true)).count > 0
        redirect_to pro_concretes_path
      elsif policy_scope(ProvinceProAsset.where(asphalt: true)).count > 0
        redirect_to pro_asphalts_path
      elsif policy_scope(ProvinceProAsset.where(crusher: true)).count > 0
        redirect_to pro_crushers_path
      end
    elsif current_user.role?(:assets_admin)
      redirect_to data_assets_path
    elsif current_user.role?(:users_admin)
      redirect_to admin_users_path
  	end

  	if current_user.role?(:assets_admin) || current_user.role?(:assets_manager) || current_user.role?(:assets_province) || current_user.role?(:assets_site)
	  	@transfer_assets = policy_scope(TransferAsset.all).order(created_at: :desc)
	  	@withdraw_assets = policy_scope(WithdrawAsset.all).order(created_at: :desc)
	  	@request_assets = policy_scope(RequestAsset.all).order(created_at: :desc)
	  end

	  if current_user.role?(:workshops_manager) || current_user.role?(:workshops_site) || current_user.role?(:assets_province) || current_user.role?(:assets_site)
	  	@repair_orders = policy_scope(RepairOrder.all).order(created_at: :desc)
	  	@breakdown_spares = BreakdownSpare.order(created_at: :desc)
	  end

	  respond_to do |format|
      format.html
      format.js
    end

  end



  def con_pro_lines

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

  def asph_pro_lines

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

    def cru_pro_lines

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


  def try
  end

end
