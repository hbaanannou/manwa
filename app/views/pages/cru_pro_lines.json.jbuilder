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
	json.one_line ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount").group("pro_crushers.day").order("pro_crushers.day")
	json.main ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(end_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
elsif (session[:start_date].present? and !session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount").group("pro_crushers.day").order("pro_crushers.day")
	json.main ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (start_date)..(last_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
elsif (!session[:start_date].present? and session[:end_date].present?)
	json.one_line ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount").group("pro_crushers.day").order("pro_crushers.day")
	json.main ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(end_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
elsif (!session[:start_date].present? and !session[:end_date].present? and ProCrusher.any?)
	json.one_line ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount").group("pro_crushers.day").order("pro_crushers.day")
	json.main ProvinceProAsset.joins(pro_crushers: :pro_crusher_subs).where('pro_crushers.day': (first_date)..(last_date)).select("pro_crushers.day, sum(pro_crusher_subs.pro_crusher_amount_meters) as amount, pro_crusher_subs.pro_crusher_type_id").group("pro_crushers.day", "pro_crusher_subs.pro_crusher_type_id").order("pro_crushers.day")
end