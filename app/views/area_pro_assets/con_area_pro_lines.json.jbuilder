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
	json.one_line ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount").group("pro_concretes.day").order("pro_concretes.day")
	json.area ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(end_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount, pro_concrete_subs.pro_concrete_type_id, pro_concrete_subs.pro_concrete_product_id").group("pro_concretes.day", "pro_concrete_subs.pro_concrete_type_id", "pro_concrete_subs.pro_concrete_product_id").order("pro_concretes.day", "pro_concrete_subs.pro_concrete_product_id")
elsif (session[:start_date].present? and !session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount").group("pro_concretes.day").order("pro_concretes.day")
	json.area ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (start_date)..(last_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount, pro_concrete_subs.pro_concrete_type_id, pro_concrete_subs.pro_concrete_product_id").group("pro_concretes.day", "pro_concrete_subs.pro_concrete_type_id", "pro_concrete_subs.pro_concrete_product_id").order("pro_concretes.day", "pro_concrete_subs.pro_concrete_product_id")
elsif (!session[:start_date].present? and session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount").group("pro_concretes.day").order("pro_concretes.day")
	json.area ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(end_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount, pro_concrete_subs.pro_concrete_type_id, pro_concrete_subs.pro_concrete_product_id").group("pro_concretes.day", "pro_concrete_subs.pro_concrete_type_id", "pro_concrete_subs.pro_concrete_product_id").order("pro_concretes.day", "pro_concrete_subs.pro_concrete_product_id")
elsif (!session[:start_date].present? and !session[:end_date].present? and ProConcrete.any?)
	json.one_line ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount").group("pro_concretes.day").order("pro_concretes.day")
	json.area ProvinceProAsset.joins(pro_concretes: :pro_concrete_subs).where('pro_concretes.day': (first_date)..(last_date)).where(area_pro_asset_id: params[:area_id]).select("pro_concretes.day, sum(pro_concrete_subs.pro_concrete_amount) as amount, pro_concrete_subs.pro_concrete_type_id, pro_concrete_subs.pro_concrete_product_id").group("pro_concretes.day", "pro_concrete_subs.pro_concrete_type_id", "pro_concrete_subs.pro_concrete_product_id").order("pro_concretes.day", "pro_concrete_subs.pro_concrete_product_id")
end