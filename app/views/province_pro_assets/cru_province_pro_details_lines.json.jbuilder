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
	json.province ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
	json.province_hours_sum ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
	json.province_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_3_8_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_3_4_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_1_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_11_2_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_oversize_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_aggregate_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (session[:start_date].present? and !session[:end_date].present?)
	json.province ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
	json.province_hours_sum ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
	json.province_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_3_8_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_3_4_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_1_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_11_2_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_oversize_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_aggregate_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (!session[:start_date].present? and session[:end_date].present?)
	json.province ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
	json.province_hours_sum ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
	json.province_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_3_8_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_3_4_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_1_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_11_2_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_oversize_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_aggregate_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

elsif (!session[:start_date].present? and !session[:end_date].present? and ProCrusher.any?)
	json.province ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
	json.province_hours_sum ProvinceProAsset.joins(:pro_crushers).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crushers.pro_crusher_hours')
	json.province_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_3_8_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 1').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_3_4_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 2').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_1_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 3').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_11_2_in_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 4').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

	json.province_oversize_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 5').sum(:'pro_crusher_subs.pro_crusher_amount_meters')
	json.province_aggregate_amount_sum ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).where('province_pro_assets.id': params[:province_id]).where('pro_crusher_subs.pro_crusher_type_id = 6').sum(:'pro_crusher_subs.pro_crusher_amount_meters')

end