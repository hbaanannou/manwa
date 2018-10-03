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
	json.one_line ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount").group("pro_asphalts.day").order("pro_asphalts.day")
	json.province ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount, pro_asphalt_subs.pro_asphalt_type_id, pro_asphalt_subs.pro_asphalt_product_id").group("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_type_id", "pro_asphalt_subs.pro_asphalt_product_id").order("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_product_id")
elsif (session[:start_date].present? and !session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount").group("pro_asphalts.day").order("pro_asphalts.day")
	json.province ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount, pro_asphalt_subs.pro_asphalt_type_id, pro_asphalt_subs.pro_asphalt_product_id").group("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_type_id", "pro_asphalt_subs.pro_asphalt_product_id").order("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_product_id")
elsif (!session[:start_date].present? and session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount").group("pro_asphalts.day").order("pro_asphalts.day")
	json.province ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount, pro_asphalt_subs.pro_asphalt_type_id, pro_asphalt_subs.pro_asphalt_product_id").group("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_type_id", "pro_asphalt_subs.pro_asphalt_product_id").order("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_product_id")
elsif (!session[:start_date].present? and !session[:end_date].present? and ProAsphalt.any?)
	json.one_line ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount").group("pro_asphalts.day").order("pro_asphalts.day")
	json.province ProvinceProAsset.joins(pro_asphalts: :pro_asphalt_subs).where('pro_asphalts.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_asphalts.day, sum(pro_asphalt_subs.pro_asphalt_amount) as amount, pro_asphalt_subs.pro_asphalt_type_id, pro_asphalt_subs.pro_asphalt_product_id").group("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_type_id", "pro_asphalt_subs.pro_asphalt_product_id").order("pro_asphalts.day", "pro_asphalt_subs.pro_asphalt_product_id")
end