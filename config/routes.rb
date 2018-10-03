Rails.application.routes.draw do

  resources :pro_crusher_subs
  resources :pro_concrete_subs
  resources :pro_asphalt_subs
  resources :pro_crushers
  resources :pro_asphalts
  resources :pro_concretes
  resources :pro_reasons
  resources :pro_crusher_types
  resources :pro_asphalt_types
  resources :pro_asphalt_products
  resources :pro_concrete_products
  resources :pro_concrete_types
  resources :province_pro_assets do
    collection do
      get :province_pro
      get :con_province_pro_lines
      get :con_province_pro_details
      get :con_province_pro_details_lines
      get :asph_province_pro_lines
      get :asph_province_pro_details
      get :asph_province_pro_details_lines
      get :cru_province_pro_lines
      get :cru_province_pro_details
      get :cru_province_pro_details_lines
    end
  end
  resources :area_pro_assets do
    collection do
      get :area_pro
      get :con_area_pro_lines
      get :asph_area_pro_lines
      get :cru_area_pro_lines
    end
  end
  resources :purchase_requests
  resources :wrong_data_assets
  resources :matrial_requests do
    collection do
      get :create_purchase_request_with_willpurchase_spares
    end
  end

  resources :breakdown_spares do
    collection do
      get :pr_index
    end
  end

  resources :checklists do
    collection do
      get :monthly
    end
  end

  resources :asset_fueldays
  resources :tank_fueldays
  resources :repair_breakdowns
  
  resources :repair_orders do
    collection do
      get :create_matrial_request_with_old_spares
    end
  end

  resources :request_assets do
    collection do
      get :accepted
    end
  end

  resources :withdraw_assets
  root 'pages#home'
  resources :pages do
    collection do
      get :home
      get :con_pro_lines
      get :asph_pro_lines
      get :cru_pro_lines
      get :try
    end
  end
  resources :transfer_assets
  resources :accident_assets
  resources :province_assets
  resources :data_assets do
    collection do
      get :index_soft
      get :charts
      get :hours_line
      get :emp_charts
      get :emp_hours_line
    end
  end
  resources :employees
  resources :color_assets
  resources :status_assets
  resources :model_assets
  resources :type_assets
  resources :site_assets
  resources :area_assets
  devise_for :users, class_name: "Admin::User"

  namespace :admin do
    resources :roles
    resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :assignments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end