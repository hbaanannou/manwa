# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: 'Star Wars' }, { name: 'Lord of the Rings' )
#   Character.create(name: 'Luke', movie: movies.first)


DataAsset.delete_all
Employee.delete_all
ColorAsset.delete_all
StatusAsset.delete_all

ModelAsset.delete_all
TypeAsset.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE model_assets_type_assets")

SiteAsset.delete_all
ProvinceAsset.delete_all
AreaAsset.delete_all

ProvinceProAsset.delete_all
AreaProAsset.delete_all
ProReason.delete_all

Admin::Role.delete_all
Admin::User.delete_all
Admin::Assignment.delete_all


u1 = Admin::User.create( id: 1, email: 'admin@admin.com', password: 'admin000', password_confirmation: 'admin000' )
u2 = Admin::User.create( id: 2, email: 'manager@manager.com', password: 'manager000', password_confirmation: 'manager000' )

pu1 = Admin::User.create( id: 3, email: 'province1@province.com', password: 'province1000', password_confirmation: 'province1000' )
pu2 = Admin::User.create( id: 4, email: 'province2@province.com', password: 'province2000', password_confirmation: 'province2000' )
pu3 = Admin::User.create( id: 5, email: 'province3@province.com', password: 'province3000', password_confirmation: 'province3000' )
pu4 = Admin::User.create( id: 6, email: 'province4@province.com', password: 'province4000', password_confirmation: 'province4000' )
pu5 = Admin::User.create( id: 7, email: 'province5@province.com', password: 'province5000', password_confirmation: 'province5000' )
pu6 = Admin::User.create( id: 8, email: 'province6@province.com', password: 'province6000', password_confirmation: 'province6000' )
pu7 = Admin::User.create( id: 9, email: 'province7@province.com', password: 'province7000', password_confirmation: 'province7000' )
pu8 = Admin::User.create( id: 10, email: 'province8@province.com', password: 'province8000', password_confirmation: 'province8000' )
pu9 = Admin::User.create( id: 11, email: 'province9@province.com', password: 'province9000', password_confirmation: 'province9000' )
pu10 = Admin::User.create( id: 12, email: 'province10@province.com', password: 'province10000', password_confirmation: 'province10000' )
pu11 = Admin::User.create( id: 13, email: 'province11@province.com', password: 'province11000', password_confirmation: 'province11000' )
pu12 = Admin::User.create( id: 14, email: 'province12@province.com', password: 'province12000', password_confirmation: 'province12000' )
pu13 = Admin::User.create( id: 15, email: 'province13@province.com', password: 'province13000', password_confirmation: 'province13000' )
pu14 = Admin::User.create( id: 16, email: 'province14@province.com', password: 'province14000', password_confirmation: 'province14000' )
pu15 = Admin::User.create( id: 17, email: 'province15@province.com', password: 'province15000', password_confirmation: 'province15000' )
pu16 = Admin::User.create( id: 18, email: 'province16@province.com', password: 'province16000', password_confirmation: 'province16000' )
pu17 = Admin::User.create( id: 19, email: 'province17@province.com', password: 'province17000', password_confirmation: 'province17000' )
pu18 = Admin::User.create( id: 20, email: 'province18@province.com', password: 'province18000', password_confirmation: 'province18000' )
pu19 = Admin::User.create( id: 21, email: 'province19@province.com', password: 'province19000', password_confirmation: 'province19000' )
pu20 = Admin::User.create( id: 22, email: 'province20@province.com', password: 'province20000', password_confirmation: 'province20000' )
pu21 = Admin::User.create( id: 23, email: 'province21@province.com', password: 'province21000', password_confirmation: 'province21000' )


su1 = Admin::User.create( id: 24, email: 'site1@site.com', password: 'site1000', password_confirmation: 'site1000' )
su2 = Admin::User.create( id: 25, email: 'site2@site.com', password: 'site2000', password_confirmation: 'site2000' )
su3 = Admin::User.create( id: 26, email: 'site3@site.com', password: 'site3000', password_confirmation: 'site3000' )
su4 = Admin::User.create( id: 27, email: 'site4@site.com', password: 'site4000', password_confirmation: 'site4000' )
su5 = Admin::User.create( id: 28, email: 'site5@site.com', password: 'site5000', password_confirmation: 'site5000' )
su6 = Admin::User.create( id: 29, email: 'site6@site.com', password: 'site6000', password_confirmation: 'site6000' )
su7 = Admin::User.create( id: 30, email: 'site7@site.com', password: 'site7000', password_confirmation: 'site7000' )
su8 = Admin::User.create( id: 31, email: 'site8@site.com', password: 'site8000', password_confirmation: 'site8000' )
su9 = Admin::User.create( id: 32, email: 'site9@site.com', password: 'site9000', password_confirmation: 'site9000' )
su10 = Admin::User.create( id: 33, email: 'site10@site.com', password: 'site10000', password_confirmation: 'site10000' )
su11 = Admin::User.create( id: 34, email: 'site11@site.com', password: 'site11000', password_confirmation: 'site11000' )
su12 = Admin::User.create( id: 35, email: 'site12@site.com', password: 'site12000', password_confirmation: 'site12000' )
su13 = Admin::User.create( id: 36, email: 'site13@site.com', password: 'site13000', password_confirmation: 'site13000' )
su14 = Admin::User.create( id: 37, email: 'site14@site.com', password: 'site14000', password_confirmation: 'site14000' )
su15 = Admin::User.create( id: 38, email: 'site15@site.com', password: 'site15000', password_confirmation: 'site15000' )
su16 = Admin::User.create( id: 39, email: 'site16@site.com', password: 'site16000', password_confirmation: 'site16000' )
su17 = Admin::User.create( id: 40, email: 'site17@site.com', password: 'site17000', password_confirmation: 'site17000' )
su18 = Admin::User.create( id: 41, email: 'site18@site.com', password: 'site18000', password_confirmation: 'site18000' )
su19 = Admin::User.create( id: 42, email: 'site19@site.com', password: 'site19000', password_confirmation: 'site19000' )
su20 = Admin::User.create( id: 43, email: 'site20@site.com', password: 'site20000', password_confirmation: 'site20000' )
su21 = Admin::User.create( id: 44, email: 'site21@site.com', password: 'site21000', password_confirmation: 'site21000' )
su22 = Admin::User.create( id: 45, email: 'site22@site.com', password: 'site22000', password_confirmation: 'site22000' )
su23 = Admin::User.create( id: 46, email: 'site23@site.com', password: 'site23000', password_confirmation: 'site23000' )
su24 = Admin::User.create( id: 47, email: 'site24@site.com', password: 'site24000', password_confirmation: 'site24000' )
su25 = Admin::User.create( id: 48, email: 'site25@site.com', password: 'site25000', password_confirmation: 'site25000' )
su26 = Admin::User.create( id: 49, email: 'site26@site.com', password: 'site26000', password_confirmation: 'site26000' )
su27 = Admin::User.create( id: 50, email: 'site27@site.com', password: 'site27000', password_confirmation: 'site27000' )
su28 = Admin::User.create( id: 51, email: 'site28@site.com', password: 'site28000', password_confirmation: 'site28000' )
su29 = Admin::User.create( id: 52, email: 'site29@site.com', password: 'site29000', password_confirmation: 'site29000' )
su30 = Admin::User.create( id: 53, email: 'site30@site.com', password: 'site30000', password_confirmation: 'site30000' )
su31 = Admin::User.create( id: 54, email: 'site31@site.com', password: 'site31000', password_confirmation: 'site31000' )
su32 = Admin::User.create( id: 55, email: 'site32@site.com', password: 'site32000', password_confirmation: 'site32000' )
su33 = Admin::User.create( id: 56, email: 'site33@site.com', password: 'site33000', password_confirmation: 'site33000' )
su34 = Admin::User.create( id: 57, email: 'site34@site.com', password: 'site34000', password_confirmation: 'site34000' )
su35 = Admin::User.create( id: 58, email: 'site35@site.com', password: 'site35000', password_confirmation: 'site35000' )
su36 = Admin::User.create( id: 59, email: 'site36@site.com', password: 'site36000', password_confirmation: 'site36000' )
su37 = Admin::User.create( id: 60, email: 'site37@site.com', password: 'site37000', password_confirmation: 'site37000' )
su38 = Admin::User.create( id: 61, email: 'site38@site.com', password: 'site38000', password_confirmation: 'site38000' )
su39 = Admin::User.create( id: 62, email: 'site39@site.com', password: 'site39000', password_confirmation: 'site39000' )
su40 = Admin::User.create( id: 63, email: 'site40@site.com', password: 'site40000', password_confirmation: 'site40000' )
su41 = Admin::User.create( id: 64, email: 'site41@site.com', password: 'site41000', password_confirmation: 'site41000' )
su42 = Admin::User.create( id: 65, email: 'site42@site.com', password: 'site42000', password_confirmation: 'site42000' )
su43 = Admin::User.create( id: 66, email: 'site43@site.com', password: 'site43000', password_confirmation: 'site43000' )
su44 = Admin::User.create( id: 67, email: 'site44@site.com', password: 'site44000', password_confirmation: 'site44000' )
su45 = Admin::User.create( id: 68, email: 'site45@site.com', password: 'site45000', password_confirmation: 'site45000' )
su46 = Admin::User.create( id: 69, email: 'site46@site.com', password: 'site46000', password_confirmation: 'site46000' )
su47 = Admin::User.create( id: 70, email: 'site47@site.com', password: 'site47000', password_confirmation: 'site47000' )
su48 = Admin::User.create( id: 71, email: 'site48@site.com', password: 'site48000', password_confirmation: 'site48000' )
su49 = Admin::User.create( id: 72, email: 'site49@site.com', password: 'site49000', password_confirmation: 'site49000' )
su50 = Admin::User.create( id: 73, email: 'site50@site.com', password: 'site50000', password_confirmation: 'site50000' )

su51 = Admin::User.create( id: 74, email: 'site51@site.com', password: 'site51000', password_confirmation: 'site51000' )
su52 = Admin::User.create( id: 75, email: 'site52@site.com', password: 'site52000', password_confirmation: 'site52000' )
su53 = Admin::User.create( id: 76, email: 'site53@site.com', password: 'site53000', password_confirmation: 'site53000' )
su54 = Admin::User.create( id: 77, email: 'site54@site.com', password: 'site54000', password_confirmation: 'site54000' )
su55 = Admin::User.create( id: 78, email: 'site55@site.com', password: 'site55000', password_confirmation: 'site55000' )
su56 = Admin::User.create( id: 79, email: 'site56@site.com', password: 'site56000', password_confirmation: 'site56000' )
su57 = Admin::User.create( id: 80, email: 'site57@site.com', password: 'site57000', password_confirmation: 'site57000' )
su58 = Admin::User.create( id: 81, email: 'site58@site.com', password: 'site58000', password_confirmation: 'site58000' )
su59 = Admin::User.create( id: 82, email: 'site59@site.com', password: 'site59000', password_confirmation: 'site59000' )
su60 = Admin::User.create( id: 83, email: 'site60@site.com', password: 'site60000', password_confirmation: 'site60000' )

su61 = Admin::User.create( id: 84, email: 'site61@site.com', password: 'site61000', password_confirmation: 'site61000' )
su62 = Admin::User.create( id: 85, email: 'site62@site.com', password: 'site62000', password_confirmation: 'site62000' )
su63 = Admin::User.create( id: 86, email: 'site63@site.com', password: 'site63000', password_confirmation: 'site63000' )
su64 = Admin::User.create( id: 87, email: 'site64@site.com', password: 'site64000', password_confirmation: 'site64000' )
su65 = Admin::User.create( id: 88, email: 'site65@site.com', password: 'site65000', password_confirmation: 'site65000' )
su66 = Admin::User.create( id: 89, email: 'site66@site.com', password: 'site66000', password_confirmation: 'site66000' )
su67 = Admin::User.create( id: 90, email: 'site67@site.com', password: 'site67000', password_confirmation: 'site67000' )
su68 = Admin::User.create( id: 91, email: 'site68@site.com', password: 'site68000', password_confirmation: 'site68000' )
su69 = Admin::User.create( id: 92, email: 'site69@site.com', password: 'site69000', password_confirmation: 'site69000' )
su70 = Admin::User.create( id: 93, email: 'site70@site.com', password: 'site70000', password_confirmation: 'site70000' )

su71 = Admin::User.create( id: 94, email: 'site71@site.com', password: 'site71000', password_confirmation: 'site71000' )
su72 = Admin::User.create( id: 95, email: 'site72@site.com', password: 'site72000', password_confirmation: 'site72000' )
su73 = Admin::User.create( id: 96, email: 'site73@site.com', password: 'site73000', password_confirmation: 'site73000' )
su74 = Admin::User.create( id: 97, email: 'site74@site.com', password: 'site74000', password_confirmation: 'site74000' )
su75 = Admin::User.create( id: 98, email: 'site75@site.com', password: 'site75000', password_confirmation: 'site75000' )
su76 = Admin::User.create( id: 99, email: 'site76@site.com', password: 'site76000', password_confirmation: 'site76000' )
su77 = Admin::User.create( id: 100, email: 'site77@site.com', password: 'site77000', password_confirmation: 'site77000' )
su78 = Admin::User.create( id: 101, email: 'site78@site.com', password: 'site78000', password_confirmation: 'site78000' )
su79 = Admin::User.create( id: 102, email: 'site79@site.com', password: 'site79000', password_confirmation: 'site79000' )
su80 = Admin::User.create( id: 103, email: 'site80@site.com', password: 'site80000', password_confirmation: 'site80000' )

su81 = Admin::User.create( id: 104, email: 'site81@site.com', password: 'site81000', password_confirmation: 'site81000' )
su82 = Admin::User.create( id: 105, email: 'site82@site.com', password: 'site82000', password_confirmation: 'site82000' )
su83 = Admin::User.create( id: 106, email: 'site83@site.com', password: 'site83000', password_confirmation: 'site83000' )
su84 = Admin::User.create( id: 107, email: 'site84@site.com', password: 'site84000', password_confirmation: 'site84000' )
su85 = Admin::User.create( id: 108, email: 'site85@site.com', password: 'site85000', password_confirmation: 'site85000' )
su86 = Admin::User.create( id: 109, email: 'site86@site.com', password: 'site86000', password_confirmation: 'site86000' )
su87 = Admin::User.create( id: 110, email: 'site87@site.com', password: 'site87000', password_confirmation: 'site87000' )
su88 = Admin::User.create( id: 111, email: 'site88@site.com', password: 'site88000', password_confirmation: 'site88000' )
su89 = Admin::User.create( id: 112, email: 'site89@site.com', password: 'site89000', password_confirmation: 'site89000' )
su90 = Admin::User.create( id: 113, email: 'site90@site.com', password: 'site90000', password_confirmation: 'site90000' )

su91 = Admin::User.create( id: 114, email: 'site91@site.com', password: 'site91000', password_confirmation: 'site91000' )
su92 = Admin::User.create( id: 115, email: 'site92@site.com', password: 'site92000', password_confirmation: 'site92000' )
su93 = Admin::User.create( id: 116, email: 'site93@site.com', password: 'site93000', password_confirmation: 'site93000' )
su94 = Admin::User.create( id: 117, email: 'site94@site.com', password: 'site94000', password_confirmation: 'site94000' )
su95 = Admin::User.create( id: 118, email: 'site95@site.com', password: 'site95000', password_confirmation: 'site95000' )
su96 = Admin::User.create( id: 119, email: 'site96@site.com', password: 'site96000', password_confirmation: 'site96000' )
su97 = Admin::User.create( id: 120, email: 'site97@site.com', password: 'site97000', password_confirmation: 'site97000' )
su98 = Admin::User.create( id: 121, email: 'site98@site.com', password: 'site98000', password_confirmation: 'site98000' )
su99 = Admin::User.create( id: 122, email: 'site99@site.com', password: 'site99000', password_confirmation: 'site99000' )
su100 = Admin::User.create( id: 123, email: 'site100@site.com', password: 'site100000', password_confirmation: 'site100000' )

su101 = Admin::User.create( id: 124, email: 'site101@site.com', password: 'site101000', password_confirmation: 'site101000' )
su102 = Admin::User.create( id: 125, email: 'site102@site.com', password: 'site102000', password_confirmation: 'site102000' )
su103 = Admin::User.create( id: 126, email: 'site103@site.com', password: 'site103000', password_confirmation: 'site103000' )
su104 = Admin::User.create( id: 127, email: 'site104@site.com', password: 'site104000', password_confirmation: 'site104000' )
su105 = Admin::User.create( id: 128, email: 'site105@site.com', password: 'site105000', password_confirmation: 'site105000' )
su106 = Admin::User.create( id: 129, email: 'site106@site.com', password: 'site106000', password_confirmation: 'site106000' )
su107 = Admin::User.create( id: 130, email: 'site107@site.com', password: 'site107000', password_confirmation: 'site107000' )
su108 = Admin::User.create( id: 131, email: 'site108@site.com', password: 'site108000', password_confirmation: 'site108000' )
su109 = Admin::User.create( id: 132, email: 'site109@site.com', password: 'site109000', password_confirmation: 'site109000' )
su110 = Admin::User.create( id: 133, email: 'site110@site.com', password: 'site110000', password_confirmation: 'site110000' )

su111 = Admin::User.create( id: 134, email: 'site111@site.com', password: 'site111000', password_confirmation: 'site111000' )
su112 = Admin::User.create( id: 135, email: 'site112@site.com', password: 'site112000', password_confirmation: 'site112000' )
su113 = Admin::User.create( id: 136, email: 'site113@site.com', password: 'site113000', password_confirmation: 'site113000' )
su114 = Admin::User.create( id: 137, email: 'site114@site.com', password: 'site114000', password_confirmation: 'site114000' )
su115 = Admin::User.create( id: 138, email: 'site115@site.com', password: 'site115000', password_confirmation: 'site115000' )
su116 = Admin::User.create( id: 139, email: 'site116@site.com', password: 'site116000', password_confirmation: 'site116000' )
su117 = Admin::User.create( id: 140, email: 'site117@site.com', password: 'site117000', password_confirmation: 'site117000' )
su118 = Admin::User.create( id: 141, email: 'site118@site.com', password: 'site118000', password_confirmation: 'site118000' )
su119 = Admin::User.create( id: 142, email: 'site119@site.com', password: 'site119000', password_confirmation: 'site119000' )
su120 = Admin::User.create( id: 143, email: 'site120@site.com', password: 'site120000', password_confirmation: 'site120000' )

su121 = Admin::User.create( id: 144, email: 'site121@site.com', password: 'site121000', password_confirmation: 'site121000' )
su122 = Admin::User.create( id: 145, email: 'site122@site.com', password: 'site122000', password_confirmation: 'site122000' )
su123 = Admin::User.create( id: 146, email: 'site123@site.com', password: 'site123000', password_confirmation: 'site123000' )
su124 = Admin::User.create( id: 147, email: 'site124@site.com', password: 'site124000', password_confirmation: 'site124000' )
su125 = Admin::User.create( id: 148, email: 'site125@site.com', password: 'site125000', password_confirmation: 'site125000' )
su126 = Admin::User.create( id: 149, email: 'site126@site.com', password: 'site126000', password_confirmation: 'site126000' )
su127 = Admin::User.create( id: 150, email: 'site127@site.com', password: 'site127000', password_confirmation: 'site127000' )
su128 = Admin::User.create( id: 151, email: 'site128@site.com', password: 'site128000', password_confirmation: 'site128000' )
su129 = Admin::User.create( id: 152, email: 'site129@site.com', password: 'site129000', password_confirmation: 'site129000' )
su130 = Admin::User.create( id: 153, email: 'site130@site.com', password: 'site130000', password_confirmation: 'site130000' )
su131 = Admin::User.create( id: 154, email: 'site131@site.com', password: 'site131000', password_confirmation: 'site131000' )
su132 = Admin::User.create( id: 155, email: 'site132@site.com', password: 'site132000', password_confirmation: 'site132000' )

su133 = Admin::User.create( id: 156, email: 'wmanager@manager.com', password: 'wmanager000', password_confirmation: 'wmanager000' )

su134 = Admin::User.create( id: 157, email: 'rstore@store.com', password: 'rstore000', password_confirmation: 'rstore000' )

su135 = Admin::User.create( id: 158, email: 'rfuel@fuel.com', password: 'rfuel000', password_confirmation: 'rfuel000' )
su136 = Admin::User.create( id: 159, email: 'tfuel@fuel.com', password: 'tfuel000', password_confirmation: 'tfuel000' )
su137 = Admin::User.create( id: 160, email: 'rchecklist@checklist.com', password: 'rchecklist000', password_confirmation: 'rchecklist000' )
su138 = Admin::User.create( id: 161, email: 'tchecklist@checklist.com', password: 'tchecklist000', password_confirmation: 'tchecklist000' )

su139 = Admin::User.create( id: 162, email: 'tstore@store.com', password: 'tstore000', password_confirmation: 'tstore000' )

su140 = Admin::User.create( id: 163, email: 'purchase@purchase.com', password: 'purchase000', password_confirmation: 'purchase000' )

ppu1 = Admin::User.create( id: 164, email: 'production1@production.com', password: 'production1000', password_confirmation: 'production1000' )
ppu2 = Admin::User.create( id: 165, email: 'production2@production.com', password: 'production2000', password_confirmation: 'production2000' )
ppu3 = Admin::User.create( id: 166, email: 'production3@production.com', password: 'production3000', password_confirmation: 'production3000' )
ppu4 = Admin::User.create( id: 167, email: 'production4@production.com', password: 'production4000', password_confirmation: 'production4000' )
ppu5 = Admin::User.create( id: 168, email: 'production5@production.com', password: 'production5000', password_confirmation: 'production5000' )
ppu6 = Admin::User.create( id: 169, email: 'production6@production.com', password: 'production6000', password_confirmation: 'production6000' )
ppu7 = Admin::User.create( id: 170, email: 'production7@production.com', password: 'production7000', password_confirmation: 'production7000' )
ppu8 = Admin::User.create( id: 171, email: 'production8@production.com', password: 'production8000', password_confirmation: 'production8000' )
ppu9 = Admin::User.create( id: 172, email: 'production9@production.com', password: 'production9000', password_confirmation: 'production9000' )
ppu10 = Admin::User.create( id: 173, email: 'production10@production.com', password: 'production10000', password_confirmation: 'production10000' )

padmin = Admin::User.create( id: 174, email: 'padmin@admin.com', password: 'padmin000', password_confirmation: 'padmin000' )
uadmin = Admin::User.create( id: 175, email: 'uadmin@admin.com', password: 'uadmin000', password_confirmation: 'uadmin000' )




r1 = Admin::Role.create( id: 1, role_name: 'assets_admin', role_remarks: 'assets admin role' )
r2 = Admin::Role.create( id: 2, role_name: 'assets_manager', role_remarks: 'assets manager role' )
r3 = Admin::Role.create( id: 3, role_name: 'assets_province', role_remarks: 'assets province role' )
r4 = Admin::Role.create( id: 4, role_name: 'assets_site', role_remarks: 'assets site role' )
r5 = Admin::Role.create( id: 5, role_name: 'workshops_manager', role_remarks: 'workshops manager role' )
r6 = Admin::Role.create( id: 6, role_name: 'workshops_site', role_remarks: 'workshops site role' )
r7 = Admin::Role.create( id: 7, role_name: 'rstore', role_remarks: 'Riyadh store role' )
r8 = Admin::Role.create( id: 8, role_name: 'rfuel', role_remarks: 'fuel riyadh' )
r9 = Admin::Role.create( id: 9, role_name: 'tfuel', role_remarks: 'fuel tabuk' )
r10 = Admin::Role.create( id: 10, role_name: 'rchecklist', role_remarks: 'checklist riyadh' )
r11 = Admin::Role.create( id: 11, role_name: 'tchecklist', role_remarks: 'checklist tabuk' )
r12 = Admin::Role.create( id: 12, role_name: 'tstore', role_remarks: 'Tabuk store role' )
r13 = Admin::Role.create( id: 13, role_name: 'purchase', role_remarks: 'Purchase role' )
r14 = Admin::Role.create( id: 14, role_name: 'production_province', role_remarks: 'production province role' )
r15 = Admin::Role.create( id: 15, role_name: 'production_admin', role_remarks: 'production admin role' )
r16 = Admin::Role.create( id: 16, role_name: 'users_admin', role_remarks: 'users admin role' )


emp1 = Employee.create( id: 1, employee_number: '13795', employee_name: 'M Mnazu', employee_mobile: "0558765432" )
emp2 = Employee.create( id: 2, employee_number: '9036', employee_name: 'Ahmed Ali', employee_mobile: "0552239879" )
emp3 = Employee.create( id: 3, employee_number: '10011', employee_name: 'Mohamed Mohamed', employee_mobile: "0545987543" )


Admin::Assignment.create( id: 1, user: u1, role: r1, employee: emp1 )
Admin::Assignment.create( id: 2, user: u2, role: r2, employee: emp1 )

Admin::Assignment.create( id: 3, user: pu1, role: r3, employee: emp1 )
Admin::Assignment.create( id: 4, user: pu2, role: r3, employee: emp1 )
Admin::Assignment.create( id: 5, user: pu3, role: r3, employee: emp1 )
Admin::Assignment.create( id: 6, user: pu4, role: r3, employee: emp1 )
Admin::Assignment.create( id: 7, user: pu5, role: r3, employee: emp1 )
Admin::Assignment.create( id: 8, user: pu6, role: r3, employee: emp1 )
Admin::Assignment.create( id: 9, user: pu7, role: r3, employee: emp1 )
Admin::Assignment.create( id: 10, user: pu8, role: r3, employee: emp1 )
Admin::Assignment.create( id: 11, user: pu9, role: r3, employee: emp1 )
Admin::Assignment.create( id: 12, user: pu10, role: r3, employee: emp1 )
Admin::Assignment.create( id: 13, user: pu11, role: r3, employee: emp1 )
Admin::Assignment.create( id: 14, user: pu12, role: r3, employee: emp1 )
Admin::Assignment.create( id: 15, user: pu13, role: r3, employee: emp1 )
Admin::Assignment.create( id: 16, user: pu14, role: r3, employee: emp1 )
Admin::Assignment.create( id: 17, user: pu15, role: r3, employee: emp1 )
Admin::Assignment.create( id: 18, user: pu16, role: r3, employee: emp1 )
Admin::Assignment.create( id: 19, user: pu17, role: r3, employee: emp1 )
Admin::Assignment.create( id: 20, user: pu18, role: r3, employee: emp1 )
Admin::Assignment.create( id: 21, user: pu19, role: r3, employee: emp1 )
Admin::Assignment.create( id: 22, user: pu20, role: r3, employee: emp1 )
Admin::Assignment.create( id: 23, user: pu21, role: r3, employee: emp1 )

Admin::Assignment.create( id: 24, user: su1, role: r4, employee: emp1 )
Admin::Assignment.create( id: 25, user: su2, role: r4, employee: emp1 )
Admin::Assignment.create( id: 26, user: su3, role: r4, employee: emp1 )
Admin::Assignment.create( id: 27, user: su4, role: r6, employee: emp1 )
Admin::Assignment.create( id: 28, user: su5, role: r4, employee: emp1 )
Admin::Assignment.create( id: 29, user: su6, role: r4, employee: emp1 )
Admin::Assignment.create( id: 30, user: su7, role: r4, employee: emp1 )
Admin::Assignment.create( id: 31, user: su8, role: r6, employee: emp1 )
Admin::Assignment.create( id: 32, user: su9, role: r4, employee: emp1 )
Admin::Assignment.create( id: 33, user: su10, role: r4, employee: emp1 )
Admin::Assignment.create( id: 34, user: su11, role: r4, employee: emp1 )
Admin::Assignment.create( id: 35, user: su12, role: r4, employee: emp1 )
Admin::Assignment.create( id: 36, user: su13, role: r6, employee: emp1 )
Admin::Assignment.create( id: 37, user: su14, role: r4, employee: emp1 )
Admin::Assignment.create( id: 38, user: su15, role: r4, employee: emp1 )
Admin::Assignment.create( id: 39, user: su16, role: r4, employee: emp1 )
Admin::Assignment.create( id: 40, user: su17, role: r4, employee: emp1 )
Admin::Assignment.create( id: 41, user: su18, role: r4, employee: emp1 )
Admin::Assignment.create( id: 42, user: su19, role: r4, employee: emp1 )
Admin::Assignment.create( id: 43, user: su20, role: r4, employee: emp1 )
Admin::Assignment.create( id: 44, user: su21, role: r4, employee: emp1 )
Admin::Assignment.create( id: 45, user: su22, role: r4, employee: emp1 )
Admin::Assignment.create( id: 46, user: su23, role: r4, employee: emp1 )
Admin::Assignment.create( id: 47, user: su24, role: r4, employee: emp1 )
Admin::Assignment.create( id: 48, user: su25, role: r4, employee: emp1 )
Admin::Assignment.create( id: 49, user: su26, role: r6, employee: emp1 )
Admin::Assignment.create( id: 50, user: su27, role: r4, employee: emp1 )
Admin::Assignment.create( id: 51, user: su28, role: r4, employee: emp1 )
Admin::Assignment.create( id: 52, user: su29, role: r4, employee: emp1 )
Admin::Assignment.create( id: 53, user: su30, role: r4, employee: emp1 )
Admin::Assignment.create( id: 54, user: su31, role: r4, employee: emp1 )
Admin::Assignment.create( id: 55, user: su32, role: r4, employee: emp1 )
Admin::Assignment.create( id: 56, user: su33, role: r6, employee: emp1 )
Admin::Assignment.create( id: 57, user: su34, role: r4, employee: emp1 )
Admin::Assignment.create( id: 58, user: su35, role: r4, employee: emp1 )
Admin::Assignment.create( id: 59, user: su36, role: r4, employee: emp1 )
Admin::Assignment.create( id: 60, user: su37, role: r4, employee: emp1 )
Admin::Assignment.create( id: 61, user: su38, role: r4, employee: emp1 )
Admin::Assignment.create( id: 62, user: su39, role: r4, employee: emp1 )
Admin::Assignment.create( id: 63, user: su40, role: r4, employee: emp1 )
Admin::Assignment.create( id: 64, user: su41, role: r4, employee: emp1 )
Admin::Assignment.create( id: 65, user: su42, role: r4, employee: emp1 )
Admin::Assignment.create( id: 66, user: su43, role: r4, employee: emp1 )
Admin::Assignment.create( id: 67, user: su44, role: r4, employee: emp1 )
Admin::Assignment.create( id: 68, user: su45, role: r6, employee: emp1 )
Admin::Assignment.create( id: 69, user: su46, role: r4, employee: emp1 )
Admin::Assignment.create( id: 70, user: su47, role: r4, employee: emp1 )
Admin::Assignment.create( id: 71, user: su48, role: r4, employee: emp1 )
Admin::Assignment.create( id: 72, user: su49, role: r4, employee: emp1 )
Admin::Assignment.create( id: 73, user: su50, role: r4, employee: emp1 )
Admin::Assignment.create( id: 74, user: su51, role: r4, employee: emp1 )
Admin::Assignment.create( id: 75, user: su52, role: r4, employee: emp1 )
Admin::Assignment.create( id: 76, user: su53, role: r4, employee: emp1 )
Admin::Assignment.create( id: 77, user: su54, role: r6, employee: emp1 )
Admin::Assignment.create( id: 78, user: su55, role: r4, employee: emp1 )
Admin::Assignment.create( id: 79, user: su56, role: r4, employee: emp1 )
Admin::Assignment.create( id: 80, user: su57, role: r4, employee: emp1 )
Admin::Assignment.create( id: 81, user: su58, role: r4, employee: emp1 )
Admin::Assignment.create( id: 82, user: su59, role: r4, employee: emp1 )
Admin::Assignment.create( id: 83, user: su60, role: r4, employee: emp1 )
Admin::Assignment.create( id: 84, user: su61, role: r4, employee: emp1 )
Admin::Assignment.create( id: 85, user: su62, role: r4, employee: emp1 )
Admin::Assignment.create( id: 86, user: su63, role: r4, employee: emp1 )
Admin::Assignment.create( id: 87, user: su64, role: r4, employee: emp1 )
Admin::Assignment.create( id: 88, user: su65, role: r4, employee: emp1 )
Admin::Assignment.create( id: 89, user: su66, role: r4, employee: emp1 )
Admin::Assignment.create( id: 90, user: su67, role: r4, employee: emp1 )
Admin::Assignment.create( id: 91, user: su68, role: r4, employee: emp1 )
Admin::Assignment.create( id: 92, user: su69, role: r4, employee: emp1 )
Admin::Assignment.create( id: 93, user: su70, role: r4, employee: emp1 )
Admin::Assignment.create( id: 94, user: su71, role: r4, employee: emp1 )
Admin::Assignment.create( id: 95, user: su72, role: r4, employee: emp1 )
Admin::Assignment.create( id: 96, user: su73, role: r4, employee: emp1 )
Admin::Assignment.create( id: 97, user: su74, role: r4, employee: emp1 )
Admin::Assignment.create( id: 98, user: su75, role: r4, employee: emp1 )
Admin::Assignment.create( id: 99, user: su76, role: r4, employee: emp1 )
Admin::Assignment.create( id: 100, user: su77, role: r4, employee: emp1 )
Admin::Assignment.create( id: 101, user: su78, role: r4, employee: emp1 )
Admin::Assignment.create( id: 102, user: su79, role: r4, employee: emp1 )
Admin::Assignment.create( id: 103, user: su80, role: r4, employee: emp1 )
Admin::Assignment.create( id: 104, user: su81, role: r4, employee: emp1 )
Admin::Assignment.create( id: 105, user: su82, role: r4, employee: emp1 )
Admin::Assignment.create( id: 106, user: su83, role: r4, employee: emp1 )
Admin::Assignment.create( id: 107, user: su84, role: r4, employee: emp1 )
Admin::Assignment.create( id: 108, user: su85, role: r4, employee: emp1 )
Admin::Assignment.create( id: 109, user: su86, role: r4, employee: emp1 )
Admin::Assignment.create( id: 110, user: su87, role: r4, employee: emp1 )
Admin::Assignment.create( id: 111, user: su88, role: r4, employee: emp1 )
Admin::Assignment.create( id: 112, user: su89, role: r4, employee: emp1 )
Admin::Assignment.create( id: 113, user: su90, role: r4, employee: emp1 )
Admin::Assignment.create( id: 114, user: su91, role: r4, employee: emp1 )
Admin::Assignment.create( id: 115, user: su92, role: r4, employee: emp1 )
Admin::Assignment.create( id: 116, user: su93, role: r4, employee: emp1 )
Admin::Assignment.create( id: 117, user: su94, role: r4, employee: emp1 )
Admin::Assignment.create( id: 118, user: su95, role: r4, employee: emp1 )
Admin::Assignment.create( id: 119, user: su96, role: r4, employee: emp1 )
Admin::Assignment.create( id: 120, user: su97, role: r4, employee: emp1 )
Admin::Assignment.create( id: 121, user: su98, role: r4, employee: emp1 )
Admin::Assignment.create( id: 122, user: su99, role: r4, employee: emp1 )
Admin::Assignment.create( id: 123, user: su100, role: r4, employee: emp1 )
Admin::Assignment.create( id: 124, user: su101, role: r6, employee: emp1 )
Admin::Assignment.create( id: 125, user: su102, role: r4, employee: emp1 )
Admin::Assignment.create( id: 126, user: su103, role: r4, employee: emp1 )
Admin::Assignment.create( id: 127, user: su104, role: r4, employee: emp1 )
Admin::Assignment.create( id: 128, user: su105, role: r4, employee: emp1 )
Admin::Assignment.create( id: 129, user: su106, role: r4, employee: emp1 )
Admin::Assignment.create( id: 130, user: su107, role: r4, employee: emp1 )
Admin::Assignment.create( id: 131, user: su108, role: r4, employee: emp1 )
Admin::Assignment.create( id: 132, user: su109, role: r4, employee: emp1 )
Admin::Assignment.create( id: 133, user: su110, role: r4, employee: emp1 )
Admin::Assignment.create( id: 134, user: su111, role: r4, employee: emp1 )
Admin::Assignment.create( id: 135, user: su112, role: r4, employee: emp1 )
Admin::Assignment.create( id: 136, user: su113, role: r4, employee: emp1 )
Admin::Assignment.create( id: 137, user: su114, role: r4, employee: emp1 )
Admin::Assignment.create( id: 138, user: su115, role: r4, employee: emp1 )
Admin::Assignment.create( id: 139, user: su116, role: r4, employee: emp1 )
Admin::Assignment.create( id: 140, user: su117, role: r4, employee: emp1 )
Admin::Assignment.create( id: 141, user: su118, role: r4, employee: emp1 )
Admin::Assignment.create( id: 142, user: su119, role: r4, employee: emp1 )
Admin::Assignment.create( id: 143, user: su120, role: r4, employee: emp1 )
Admin::Assignment.create( id: 144, user: su121, role: r4, employee: emp1 )
Admin::Assignment.create( id: 145, user: su122, role: r4, employee: emp1 )
Admin::Assignment.create( id: 146, user: su123, role: r4, employee: emp1 )
Admin::Assignment.create( id: 147, user: su124, role: r6, employee: emp1 )
Admin::Assignment.create( id: 148, user: su125, role: r4, employee: emp1 )
Admin::Assignment.create( id: 149, user: su126, role: r4, employee: emp1 )
Admin::Assignment.create( id: 150, user: su127, role: r6, employee: emp1 )
Admin::Assignment.create( id: 151, user: su128, role: r4, employee: emp1 )
Admin::Assignment.create( id: 152, user: su129, role: r4, employee: emp1 )
Admin::Assignment.create( id: 153, user: su130, role: r4, employee: emp1 )
Admin::Assignment.create( id: 154, user: su131, role: r4, employee: emp1 )
Admin::Assignment.create( id: 155, user: su132, role: r4, employee: emp1 )

Admin::Assignment.create( id: 156, user: su133, role: r5, employee: emp1 )

Admin::Assignment.create( id: 157, user: su134, role: r7, employee: emp1 )

Admin::Assignment.create( id: 158, user: su135, role: r8, employee: emp1 )
Admin::Assignment.create( id: 159, user: su136, role: r9, employee: emp1 )
Admin::Assignment.create( id: 160, user: su137, role: r10, employee: emp1 )
Admin::Assignment.create( id: 161, user: su138, role: r11, employee: emp1 )

Admin::Assignment.create( id: 162, user: su139, role: r12, employee: emp1 )

Admin::Assignment.create( id: 163, user: su140, role: r13, employee: emp1 )

Admin::Assignment.create( id: 164, user: ppu1, role: r14, employee: emp1 )
Admin::Assignment.create( id: 165, user: ppu2, role: r14, employee: emp1 )
Admin::Assignment.create( id: 166, user: ppu3, role: r14, employee: emp1 )
Admin::Assignment.create( id: 167, user: ppu4, role: r14, employee: emp1 )
Admin::Assignment.create( id: 168, user: ppu5, role: r14, employee: emp1 )
Admin::Assignment.create( id: 169, user: ppu6, role: r14, employee: emp1 )
Admin::Assignment.create( id: 170, user: ppu7, role: r14, employee: emp1 )
Admin::Assignment.create( id: 171, user: ppu8, role: r14, employee: emp1 )
Admin::Assignment.create( id: 172, user: ppu9, role: r14, employee: emp1 )
Admin::Assignment.create( id: 173, user: ppu10, role: r14, employee: emp1 )

Admin::Assignment.create( id: 174, user: padmin, role: r15, employee: emp1 )


area1 = AreaAsset.create( id: 1, area_asset_name: 'Riyadh' )
area2 = AreaAsset.create( id: 2, area_asset_name: 'Tabuk' )

area_pro1 = AreaProAsset.create( id: 1, area_pro_asset_name: 'Riyadh' )
area_pro2 = AreaProAsset.create( id: 2, area_pro_asset_name: 'Tabuk' )
area_pro3 = AreaProAsset.create( id: 3, area_pro_asset_name: 'JOUF' )
area_pro4 = AreaProAsset.create( id: 4, area_pro_asset_name: 'South' )

province1 = ProvinceAsset.create( id: 1, province_asset_name: 'Hota', area_asset: area1, user: pu1 )
province2 = ProvinceAsset.create( id: 2, province_asset_name: 'KHARJ', area_asset: area1, user: pu2 )
province3 = ProvinceAsset.create( id: 3, province_asset_name: 'Riyadh', area_asset: area1, user: pu3 )
province4 = ProvinceAsset.create( id: 4, province_asset_name: 'Wadi Alddwasir', area_asset: area1, user: pu4 )
province5 = ProvinceAsset.create( id: 5, province_asset_name: 'AFLAJ', area_asset: area1, user: pu5 )
province6 = ProvinceAsset.create( id: 6, province_asset_name: 'KAMIS MUSHAIT', area_asset: area1, user: pu6 )
province7 = ProvinceAsset.create( id: 7, province_asset_name: 'AL SOLAYYEL', area_asset: area1, user: pu7 )
province8 = ProvinceAsset.create( id: 8, province_asset_name: 'HAIL', area_asset: area1, user: pu8 )
province9 = ProvinceAsset.create( id: 9, province_asset_name: 'Najran', area_asset: area1, user: pu9 )
province10 = ProvinceAsset.create( id: 10, province_asset_name: 'Hareeq', area_asset: area1, user: pu10 )
province11 = ProvinceAsset.create( id: 11, province_asset_name: 'Husainiah', area_asset: area1, user: pu11 )
province12 = ProvinceAsset.create( id: 12, province_asset_name: 'JAFI', area_asset: area1, user: pu12 )

province13 = ProvinceAsset.create( id: 13, province_asset_name: 'TABUK', area_asset: area2, user: pu13 )
province14 = ProvinceAsset.create( id: 14, province_asset_name: 'DUBA', area_asset: area2, user: pu14 )
province15 = ProvinceAsset.create( id: 15, province_asset_name: 'JOUF', area_asset: area2, user: pu15 )
province16 = ProvinceAsset.create( id: 16, province_asset_name: 'TAYMA', area_asset: area2, user: pu16 )
province17 = ProvinceAsset.create( id: 17, province_asset_name: 'QURAYAT', area_asset: area2, user: pu17 )
province18 = ProvinceAsset.create( id: 18, province_asset_name: 'AL HAMMAD', area_asset: area2, user: pu18 )
province19 = ProvinceAsset.create( id: 19, province_asset_name: 'ALWAJH', area_asset: area2, user: pu19 )
province20 = ProvinceAsset.create( id: 20, province_asset_name: 'SHARMA', area_asset: area2, user: pu20 )
province21 = ProvinceAsset.create( id: 21, province_asset_name: 'BADIA', area_asset: area2, user: pu21 )


province_pro1 = ProvinceProAsset.create( id: 1, province_pro_asset_name: 'Al-Jafi', area_pro_asset: area_pro1, user: ppu1 )
province_pro2 = ProvinceProAsset.create( id: 2, province_pro_asset_name: 'Hota - Al-Hareeq', area_pro_asset: area_pro1, user: ppu2 )
province_pro3 = ProvinceProAsset.create( id: 3, province_pro_asset_name: 'Al-Aflag', area_pro_asset: area_pro1, user: ppu3 )
province_pro4 = ProvinceProAsset.create( id: 4, province_pro_asset_name: 'Al-Solayel', area_pro_asset: area_pro1, user: ppu4 )

province_pro5 = ProvinceProAsset.create( id: 5, province_pro_asset_name: 'Tabuk-Camp', area_pro_asset: area_pro2, user: ppu5 )
province_pro6 = ProvinceProAsset.create( id: 6, province_pro_asset_name: 'Al-Badeaa', area_pro_asset: area_pro2, user: ppu5 )
province_pro7 = ProvinceProAsset.create( id: 7, province_pro_asset_name: 'Taymaa', area_pro_asset: area_pro2, user: ppu5 )
province_pro8 = ProvinceProAsset.create( id: 8, province_pro_asset_name: 'Al-Kharytah', area_pro_asset: area_pro2, user: ppu5 )
province_pro9 = ProvinceProAsset.create( id: 9, province_pro_asset_name: 'Sharma', area_pro_asset: area_pro2, user: ppu5 )
province_pro10 = ProvinceProAsset.create( id: 10, province_pro_asset_name: 'Al-Wagh', area_pro_asset: area_pro2, user: ppu5 )

province_pro11 = ProvinceProAsset.create( id: 11, province_pro_asset_name: 'Kulib-Khedr', area_pro_asset: area_pro3, user: ppu6 )
province_pro12 = ProvinceProAsset.create( id: 12, province_pro_asset_name: 'Al-Hamaad', area_pro_asset: area_pro3, user: ppu6 )
province_pro13 = ProvinceProAsset.create( id: 13, province_pro_asset_name: 'Al-Quriaat', area_pro_asset: area_pro3, user: ppu6 )
province_pro14 = ProvinceProAsset.create( id: 14, province_pro_asset_name: 'Al-Khoaa', area_pro_asset: area_pro3, user: ppu7 )
province_pro15 = ProvinceProAsset.create( id: 15, province_pro_asset_name: 'Hael', area_pro_asset: area_pro3, user: ppu8 )

province_pro16 = ProvinceProAsset.create( id: 16, province_pro_asset_name: 'Kamees Mesheet', area_pro_asset: area_pro4, user: ppu9 )
province_pro17 = ProvinceProAsset.create( id: 17, province_pro_asset_name: 'Wadi Ben Hashbel', area_pro_asset: area_pro4, user: ppu9 )
province_pro18 = ProvinceProAsset.create( id: 18, province_pro_asset_name: 'Al-Hosainya', area_pro_asset: area_pro4, user: ppu10 )
province_pro19 = ProvinceProAsset.create( id: 19, province_pro_asset_name: 'Al-Gamaa', area_pro_asset: area_pro4, user: ppu10 )
province_pro20 = ProvinceProAsset.create( id: 20, province_pro_asset_name: 'Sultanah', area_pro_asset: area_pro4, user: ppu10 )


pro_reason1 = ProReason.create( id: 1, pro_reason_name: 'يوم جمعة او عطلة' )
pro_reason2 = ProReason.create( id: 2, pro_reason_name: 'سوء أحوال طقس' )
pro_reason3 = ProReason.create( id: 3, pro_reason_name: 'امر أيقاف' )
pro_reason4 = ProReason.create( id: 4, pro_reason_name: 'تحت الصيانة' )
pro_reason5 = ProReason.create( id: 5, pro_reason_name: 'نقص بالديزل' )
pro_reason6 = ProReason.create( id: 6, pro_reason_name: 'نقص بالبيتومين' )
pro_reason7 = ProReason.create( id: 7, pro_reason_name: 'نقص بالماء' )
pro_reason8 = ProReason.create( id: 8, pro_reason_name: 'نقص عمالة' )
pro_reason9 = ProReason.create( id: 9, pro_reason_name: 'نقص معدات' )
pro_reason10 = ProReason.create( id: 10, pro_reason_name: 'عطل بالمعدات' )
pro_reason11 = ProReason.create( id: 11, pro_reason_name: 'عطل بالمكسر' )
pro_reason12 = ProReason.create( id: 12, pro_reason_name: 'عطل بالمضخه' )
pro_reason13 = ProReason.create( id: 13, pro_reason_name: 'عطل بالخلاطة' )
pro_reason14 = ProReason.create( id: 14, pro_reason_name: 'عطل بالسخان' )
pro_reason15 = ProReason.create( id: 15, pro_reason_name: 'عطل بالمبرد' )
pro_reason16 = ProReason.create( id: 16, pro_reason_name: 'عطل بالكسارة' )
pro_reason17 = ProReason.create( id: 17, pro_reason_name: 'غير ذلك - التوضيح في الملاحظات' )

pro_concrete_type1 = ProConcreteType.create( id: 1, pro_concrete_type_name: '200' )
pro_concrete_type2 = ProConcreteType.create( id: 2, pro_concrete_type_name: '250' )
pro_concrete_type3 = ProConcreteType.create( id: 3, pro_concrete_type_name: '280' )
pro_concrete_type4 = ProConcreteType.create( id: 4, pro_concrete_type_name: '300' )
pro_concrete_type5 = ProConcreteType.create( id: 5, pro_concrete_type_name: '350' )
pro_concrete_type6 = ProConcreteType.create( id: 6, pro_concrete_type_name: '375' )
pro_concrete_type7 = ProConcreteType.create( id: 7, pro_concrete_type_name: '400' )
pro_concrete_type8 = ProConcreteType.create( id: 8, pro_concrete_type_name: '420' )
pro_concrete_type9 = ProConcreteType.create( id: 9, pro_concrete_type_name: '425' )
pro_concrete_type10 = ProConcreteType.create( id: 10, pro_concrete_type_name: '440' )
pro_concrete_type11 = ProConcreteType.create( id: 11, pro_concrete_type_name: '450' )
pro_concrete_type12 = ProConcreteType.create( id: 12, pro_concrete_type_name: '475' )

pro_concrete_product1 = ProConcreteProduct.create( id: 1, pro_concrete_product_name: 'اسمنت عادي' )
pro_concrete_product2 = ProConcreteProduct.create( id: 2, pro_concrete_product_name: 'اسمنت مقاوم' )

pro_asphalt_type1 = ProAsphaltType.create( id: 1, pro_asphalt_type_name: 'Base Course' )
pro_asphalt_type2 = ProAsphaltType.create( id: 2, pro_asphalt_type_name: 'Wearing Course' )

pro_asphalt_product1 = ProAsphaltProduct.create( id: 1, pro_asphalt_product_name: 'محسن 70/10' )
pro_asphalt_product2 = ProAsphaltProduct.create( id: 2, pro_asphalt_product_name: 'محسن 76/10' )
pro_asphalt_product3 = ProAsphaltProduct.create( id: 3, pro_asphalt_product_name: 'مرشال 60/70' )

pro_crusher_type1 = ProCrusherType.create( id: 1, pro_crusher_type_name: '3/8 IN' )
pro_crusher_type2 = ProCrusherType.create( id: 2, pro_crusher_type_name: '3/4 IN' )
pro_crusher_type3 = ProCrusherType.create( id: 3, pro_crusher_type_name: '1 IN' )
pro_crusher_type4 = ProCrusherType.create( id: 4, pro_crusher_type_name: '1 1/2 IN' )
pro_crusher_type5 = ProCrusherType.create( id: 5, pro_crusher_type_name: 'Oversize' )
pro_crusher_type6 = ProCrusherType.create( id: 6, pro_crusher_type_name: 'اجرجيت' )


site1 = SiteAsset.create( id: 1, site_asset_name: 'AL SOLAYYEL ASPHALT PLANT', province_asset: province7, user: su1 )
site2 = SiteAsset.create( id: 2, site_asset_name: 'AL SOLAYYEL CONCRETE PLANT', province_asset: province7, user: su2 )
site3 = SiteAsset.create( id: 3, site_asset_name: 'AL SOLAYYEL MAINTENANCE', province_asset: province7, user: su3 )
site4 = SiteAsset.create( id: 4, site_asset_name: 'AL SOLAYYEL WORKSHOP', province_asset: province7, user: su4, site_type: :workshop )
site5 = SiteAsset.create( id: 5, site_asset_name: 'AL SOLAYYEL', province_asset: province7, user: su5 )
site6 = SiteAsset.create( id: 6, site_asset_name: 'AL SOLAYYEL CRUSHER', province_asset: province7, user: su6 )
site7 = SiteAsset.create( id: 7, site_asset_name: 'Hota Project', province_asset: province1, user: su7 )
site8 = SiteAsset.create( id: 8, site_asset_name: 'WorkShop Al Hota', province_asset: province1, user: su8, site_type: :workshop )
site9 = SiteAsset.create( id: 9, site_asset_name: 'Lab Al Hota', province_asset: province1, user: su9 )
site10 = SiteAsset.create( id: 10, site_asset_name: 'KHARJ', province_asset: province2, user: su10 )
site11 = SiteAsset.create( id: 11, site_asset_name: 'KHARJ/426', province_asset: province2, user: su11 )
site12 = SiteAsset.create( id: 12, site_asset_name: 'Riyadh', province_asset: province3, user: su12 )
site13 = SiteAsset.create( id: 13, site_asset_name: 'Main WorkShop Riyadh', province_asset: province3, user: su13, site_type: :workshop )
site14 = SiteAsset.create( id: 14, site_asset_name: 'Lab Riyadh', province_asset: province3, user: su14 )
site15 = SiteAsset.create( id: 15, site_asset_name: 'Camp Riyadh', province_asset: province3, user: su15 )
site16 = SiteAsset.create( id: 16, site_asset_name: 'Main Office Riyadh', province_asset: province3, user: su16 )
site17 = SiteAsset.create( id: 17, site_asset_name: 'Riyadh Main WareHouse', province_asset: province3, user: su17 )
site18 = SiteAsset.create( id: 18, site_asset_name: 'Wadi Alddwasir', province_asset: province4, user: su18 )
site19 = SiteAsset.create( id: 19, site_asset_name: 'AFLAJ CRUSHER', province_asset: province5, user: su19 )
site20 = SiteAsset.create( id: 20, site_asset_name: 'AL AFLAJ', province_asset: province5, user: su20 )
site21 = SiteAsset.create( id: 21, site_asset_name: 'KAMIS MUSHAIT CONCRETE PLANT #4', province_asset: province6, user: su21 )
site22 = SiteAsset.create( id: 22, site_asset_name: 'KAMIS MUSHAIT', province_asset: province6, user: su22 )
site23 = SiteAsset.create( id: 23, site_asset_name: 'KAMIS MUSHAIT CRUSHER', province_asset: province6, user: su23 )
site24 = SiteAsset.create( id: 24, site_asset_name: 'Khames Mshet Concrete Plant', province_asset: province6, user: su24 )
site25 = SiteAsset.create( id: 25, site_asset_name: 'HAIL', province_asset: province8, user: su25 )
site26 = SiteAsset.create( id: 26, site_asset_name: 'Najran WorkShop', province_asset: province9, user: su26, site_type: :workshop )
site27 = SiteAsset.create( id: 27, site_asset_name: 'Najran Maintenance Project', province_asset: province9, user: su27 )
site28 = SiteAsset.create( id: 28, site_asset_name: 'Najran Municipalities', province_asset: province9, user: su28 )
site29 = SiteAsset.create( id: 29, site_asset_name: 'Amara Khamees', province_asset: province6, user: su29 )
site30 = SiteAsset.create( id: 30, site_asset_name: 'Najran w/shop', province_asset: province9, user: su30 )
site31 = SiteAsset.create( id: 31, site_asset_name: 'Najran Asphalt', province_asset: province9, user: su31 )
site32 = SiteAsset.create( id: 32, site_asset_name: 'Najran Project', province_asset: province9, user: su32 )
site33 = SiteAsset.create( id: 33, site_asset_name: 'Najran Maintenance Workshop', province_asset: province9, user: su33, site_type: :workshop )
site34 = SiteAsset.create( id: 34, site_asset_name: 'Najran Surveyor', province_asset: province9, user: su34 )
site35 = SiteAsset.create( id: 35, site_asset_name: 'NAJRAN CONCRETE PLENT', province_asset: province9, user: su35 )
site36 = SiteAsset.create( id: 36, site_asset_name: 'SHEQRY CAMP', province_asset: province3, user: su36 )
site37 = SiteAsset.create( id: 37, site_asset_name: 'Hareeq Crusher', province_asset: province10, user: su37 )
site38 = SiteAsset.create( id: 38, site_asset_name: 'HARIQ ', province_asset: province10, user: su38 )
site39 = SiteAsset.create( id: 39, site_asset_name: 'Husainiah Crusher', province_asset: province11, user: su39 )
site40 = SiteAsset.create( id: 40, site_asset_name: 'Husainiah Lab', province_asset: province11, user: su40 )
site41 = SiteAsset.create( id: 41, site_asset_name: 'Husainiah W/Shop', province_asset: province11, user: su41 )
site42 = SiteAsset.create( id: 42, site_asset_name: 'JAFI', province_asset: province12, user: su42 )
site43 = SiteAsset.create( id: 43, site_asset_name: 'AL Solayyel Annadik', province_asset: province7, user: su43 )
site44 = SiteAsset.create( id: 44, site_asset_name: 'TABUK OLD CAMP', province_asset: province13, user: su44 )
site45 = SiteAsset.create( id: 45, site_asset_name: 'TABUK OLD WorkShop', province_asset: province13, user: su45, site_type: :workshop )
site46 = SiteAsset.create( id: 46, site_asset_name: 'BALADIA TABUK', province_asset: province13, user: su46 )
site47 = SiteAsset.create( id: 47, site_asset_name: 'TABUK WAREHOSE', province_asset: province13, user: su47 )
site48 = SiteAsset.create( id: 48, site_asset_name: 'HEAD OFFICE TABUK', province_asset: province13, user: su48 )
site49 = SiteAsset.create( id: 49, site_asset_name: 'CONCRETE PLANT TABUK', province_asset: province13, user: su49 )
site50 = SiteAsset.create( id: 50, site_asset_name: 'TABUK LAB', province_asset: province13, user: su50 )
site51 = SiteAsset.create( id: 51, site_asset_name: 'AMANAT TABUK', province_asset: province13, user: su51 )
site52 = SiteAsset.create( id: 52, site_asset_name: 'Tabuk New Camp', province_asset: province13, user: su52 )
site53 = SiteAsset.create( id: 53, site_asset_name: 'Tabuk', province_asset: province13, user: su53 )
site54 = SiteAsset.create( id: 54, site_asset_name: 'Tabuk Main Workshop', province_asset: province13, user: su54, site_type: :workshop )
site55 = SiteAsset.create( id: 55, site_asset_name: 'Tabuk Main LAB', province_asset: province13, user: su55 )
site56 = SiteAsset.create( id: 56, site_asset_name: 'Derab BRT Project', province_asset: province21, user: su56 )
site57 = SiteAsset.create( id: 57, site_asset_name: 'MADINA ROAD', province_asset: province3, user: su57 )
site58 = SiteAsset.create( id: 58, site_asset_name: 'Al Jahid Project', province_asset: province3, user: su58 )
site59 = SiteAsset.create( id: 59, site_asset_name: 'JAHID G19', province_asset: province3, user: su59 )
site60 = SiteAsset.create( id: 60, site_asset_name: 'ARAMCO', province_asset: province3, user: su60 )
site61 = SiteAsset.create( id: 61, site_asset_name: 'ARAMCO-CONCRETE PLANT', province_asset: province3, user: su61 )
site62 = SiteAsset.create( id: 62, site_asset_name: 'ARAMCO LAB', province_asset: province3, user: su62 )
site63 = SiteAsset.create( id: 63, site_asset_name: 'BRT', province_asset: province3, user: su63 )
site64 = SiteAsset.create( id: 64, site_asset_name: 'Prince Mohd BRT Project', province_asset: province3, user: su64 )
site65 = SiteAsset.create( id: 65, site_asset_name: 'Office BRT Project', province_asset: province3, user: su65 )
site66 = SiteAsset.create( id: 66, site_asset_name: 'BRT OFFICE', province_asset: province3, user: su66 )
site67 = SiteAsset.create( id: 67, site_asset_name: '1205 PROJECT', province_asset: province3, user: su67 )
site68 = SiteAsset.create( id: 68, site_asset_name: 'Crusher 217', province_asset: province3, user: su68 )
site69 = SiteAsset.create( id: 69, site_asset_name: 'Asphalt Plant 119', province_asset: province3, user: su69 )
site70 = SiteAsset.create( id: 70, site_asset_name: 'DUBA CRUSHER', province_asset: province14, user: su70 )
site71 = SiteAsset.create( id: 71, site_asset_name: 'DUBA PROJECT', province_asset: province14, user: su71 )
site72 = SiteAsset.create( id: 72, site_asset_name: 'DUBA PROJECT LAB', province_asset: province14, user: su72 )
site73 = SiteAsset.create( id: 73, site_asset_name: 'CAMP DUBA', province_asset: province14, user: su73 )
site74 = SiteAsset.create( id: 74, site_asset_name: 'JOUF', province_asset: province15, user: su74 )
site75 = SiteAsset.create( id: 75, site_asset_name: 'MAINTENANCE JOUF', province_asset: province15, user: su75 )
site76 = SiteAsset.create( id: 76, site_asset_name: 'ARAMCO-JOUF', province_asset: province15, user: su76 )
site77 = SiteAsset.create( id: 77, site_asset_name: 'University proj', province_asset: province3, user: su77 )
site78 = SiteAsset.create( id: 78, site_asset_name: 'PRODUCTION', province_asset: province3, user: su78 )
site79 = SiteAsset.create( id: 79, site_asset_name: 'PREVENTIVE MAINTENANCE 29055', province_asset: province3, user: su79 )
site80 = SiteAsset.create( id: 80, site_asset_name: '1202 PROJECT', province_asset: province3, user: su80 )
site81 = SiteAsset.create( id: 81, site_asset_name: '1102-Najan', province_asset: province9, user: su81 )
site82 = SiteAsset.create( id: 82, site_asset_name: 'TAYMA', province_asset: province16, user: su82 )
site83 = SiteAsset.create( id: 83, site_asset_name: 'QURAYAT AIIRPORT', province_asset: province17, user: su83)
site84 = SiteAsset.create( id: 84, site_asset_name: 'OFFICE QURAYAT', province_asset: province17, user: su84 )
site85 = SiteAsset.create( id: 85, site_asset_name: 'AL HAMMAD', province_asset: province18, user: su85 )
site86 = SiteAsset.create( id: 86, site_asset_name: 'ALHAMMAD LAB', province_asset: province18, user: su86 )
site87 = SiteAsset.create( id: 87, site_asset_name: 'ALWAJH CRUSHER', province_asset: province19, user: su87 )
site88 = SiteAsset.create( id: 88, site_asset_name: 'AL WAJH PROJECT', province_asset: province19, user: su88 )
site89 = SiteAsset.create( id: 89, site_asset_name: 'ASPHALT PLANET SHARMA', province_asset: province20, user: su89 )
site90 = SiteAsset.create( id: 90, site_asset_name: 'SHARMA CRUSHER', province_asset: province20, user: su90 )
site91 = SiteAsset.create( id: 91, site_asset_name: 'Industrial Area Project', province_asset: province3, user: su91 )
site92 = SiteAsset.create( id: 92, site_asset_name: 'Asphalt Group', province_asset: province3, user: su92 )
site93 = SiteAsset.create( id: 93, site_asset_name: 'QULAIB Crusher', province_asset: province3, user: su93 )
site94 = SiteAsset.create( id: 94, site_asset_name: 'BADIA ASPHALT PLANT', province_asset: province21, user: su94 )
site95 = SiteAsset.create( id: 95, site_asset_name: 'BADIA CRUSHER', province_asset: province21, user: su95 )
site96 = SiteAsset.create( id: 96, site_asset_name: 'BADIA PROJECT', province_asset: province21, user: su96 )
site97 = SiteAsset.create( id: 97, site_asset_name: 'Al Kharaj BRT Project', province_asset: province2, user: su97 )
site98 = SiteAsset.create( id: 98, site_asset_name: 'ASPHALT GP', province_asset: province3, user: su98 )
site99 = SiteAsset.create( id: 99, site_asset_name: 'Municipilty', province_asset: province3, user: su99 )
site100 = SiteAsset.create( id: 100, site_asset_name: 'CRUSHERS MEC', province_asset: province3, user: su100 )
site101 = SiteAsset.create( id: 101, site_asset_name: 'WorkShop Insurnce', province_asset: province3, user: su101, site_type: :workshop )
site102 = SiteAsset.create( id: 102, site_asset_name: 'SHARMA PROJECT', province_asset: province20, user: su102 )
site103 = SiteAsset.create( id: 103, site_asset_name: 'CONCRETE PLANET SHARMA', province_asset: province20, user: su103 )
site104 = SiteAsset.create( id: 104, site_asset_name: 'SHARMA PRODUCTION', province_asset: province20, user: su104 )
site105 = SiteAsset.create( id: 105, site_asset_name: 'wadi bin hashble', province_asset: province3, user: su105 )
site106 = SiteAsset.create( id: 106, site_asset_name: 'ALKHOAH CRUSHER', province_asset: province3, user: su106 )
site107 = SiteAsset.create( id: 107, site_asset_name: 'ABU-AJRAM', province_asset: province3, user: su107 )
site108 = SiteAsset.create( id: 108, site_asset_name: 'AL KOTAIB', province_asset: province3, user: su108 )
site109 = SiteAsset.create( id: 109, site_asset_name: 'SHAMLI', province_asset: province3, user: su109 )
site110 = SiteAsset.create( id: 110, site_asset_name: 'ZETA CRUSHER', province_asset: province3, user: su110 )
site111 = SiteAsset.create( id: 111, site_asset_name: 'ZALLOUM W.S', province_asset: province3, user: su111 )
site112 = SiteAsset.create( id: 112, site_asset_name: 'MOROUJ', province_asset: province3, user: su112 )
site113 = SiteAsset.create( id: 113, site_asset_name: 'ISSAWIYA W.S', province_asset: province3, user: su113 )
site114 = SiteAsset.create( id: 114, site_asset_name: 'MUDARAAT PROJECT', province_asset: province3, user: su114 )
site115 = SiteAsset.create( id: 115, site_asset_name: 'widi Bin Hashbal', province_asset: province3, user: su115 )
site116 = SiteAsset.create( id: 116, site_asset_name: 'SAWAMEA PROJECT', province_asset: province3, user: su116 )
site117 = SiteAsset.create( id: 117, site_asset_name: 'Swerage Project', province_asset: province3, user: su117 )
site118 = SiteAsset.create( id: 118, site_asset_name: 'ZALOUM', province_asset: province3, user: su118 )
site119 = SiteAsset.create( id: 119, site_asset_name: 'WADI bIN HASHBAL', province_asset: province3, user: su119 )
site120 = SiteAsset.create( id: 120, site_asset_name: 'ALKHOA CRUSHER', province_asset: province3, user: su120 )
site121 = SiteAsset.create( id: 121, site_asset_name: 'WADI DAFA', province_asset: province3, user: su121 )
site122 = SiteAsset.create( id: 122, site_asset_name: 'ASMA BINT ABI BAKR', province_asset: province3, user: su122 )
site123 = SiteAsset.create( id: 123, site_asset_name: 'BRT Hamza Project', province_asset: province3, user: su123 )
site124 = SiteAsset.create( id: 124, site_asset_name: 'Main WorkShop Wadi Dava', province_asset: province3, user: su124, site_type: :workshop )
site125 = SiteAsset.create( id: 125, site_asset_name: 'Tabarjal', province_asset: province3, user: su125 )
site126 = SiteAsset.create( id: 126, site_asset_name: 'ISSAWIYA', province_asset: province3, user: su126 )
site127 = SiteAsset.create( id: 127, site_asset_name: 'WorkShop Forty', province_asset: province3, user: su127, site_type: :workshop )
site128 = SiteAsset.create( id: 128, site_asset_name: 'Al Rain Project', province_asset: province3, user: su128 )
site129 = SiteAsset.create( id: 129, site_asset_name: 'SUBHAN W.S', province_asset: province3, user: su129 )
site130 = SiteAsset.create( id: 130, site_asset_name: 'N/A', province_asset: province3, user: su130 )
site131 = SiteAsset.create( id: 131, site_asset_name: 'Al solayyel Municipalities', province_asset: province7, user: su131 )
site132 = SiteAsset.create( id: 132, site_asset_name: 'SASCO', province_asset: province3, user: su132 )




type1 = TypeAsset.create( id: 1, type_asset_name: 'AIR COMPRSSOR - MOVABLE' )
type2 = TypeAsset.create( id: 2, type_asset_name: 'AIR COMPRSSOR - STATIONARY' )
type3 = TypeAsset.create( id: 3, type_asset_name: 'AMBULANCE' )
type4 = TypeAsset.create( id: 4, type_asset_name: 'Apprasion Machine' )
type5 = TypeAsset.create( id: 5, type_asset_name: 'ASPHALT CUTTER' )
type6 = TypeAsset.create( id: 6, type_asset_name: 'ASPHALT MC1 TRUCK' )
type7 = TypeAsset.create( id: 7, type_asset_name: 'ASPHALT PLANT' )
type8 = TypeAsset.create( id: 8, type_asset_name: 'BACKHOE LOADER' )
type9 = TypeAsset.create( id: 9, type_asset_name: 'BATTERY CHARGER' )
type10 = TypeAsset.create( id: 10, type_asset_name: 'BOOM TRUCK' )
type11 = TypeAsset.create( id: 11, type_asset_name: 'BOX TRAILER' )
type12 = TypeAsset.create( id: 12, type_asset_name: 'BULLDOZER' )
type13 = TypeAsset.create( id: 13, type_asset_name: 'BULLKER' )
type14 = TypeAsset.create( id: 14, type_asset_name: 'BUS' )
type15 = TypeAsset.create( id: 15, type_asset_name: 'CBR STABILITY MACHINE' )
type16 = TypeAsset.create( id: 16, type_asset_name: 'CHILLER' )
type17 = TypeAsset.create( id: 17, type_asset_name: 'CONCRETE MIXER' )
type18 = TypeAsset.create( id: 18, type_asset_name: 'CONCRETE PLANT' )
type19 = TypeAsset.create( id: 19, type_asset_name: 'CONCRETE PUMP' )
type20 = TypeAsset.create( id: 20, type_asset_name: 'CONCRETE VIBRATOR' )
type21 = TypeAsset.create( id: 21, type_asset_name: 'CONE CRUSHER' )
type22 = TypeAsset.create( id: 22, type_asset_name: 'CONTAINER STEEL' )
type23 = TypeAsset.create( id: 23, type_asset_name: 'CONTROL ROOM' )
type24 = TypeAsset.create( id: 24, type_asset_name: 'CORE CUTTING MACHINE' )
type25 = TypeAsset.create( id: 25, type_asset_name: 'CRANE' )
type26 = TypeAsset.create( id: 26, type_asset_name: 'Cutting Machine' )
type27 = TypeAsset.create( id: 27, type_asset_name: 'DIESEL TANK - STATIONARY' )
type28 = TypeAsset.create( id: 28, type_asset_name: 'DIESEL TANK MOVABLE' )
type29 = TypeAsset.create( id: 29, type_asset_name: 'DIESEL TANKER TRUCK' )
type30 = TypeAsset.create( id: 30, type_asset_name: 'DRILLING MACHINE' )
type31 = TypeAsset.create( id: 31, type_asset_name: 'DUMP TRUCK 16M' )
type32 = TypeAsset.create( id: 32, type_asset_name: 'DUMP TRUCK 3M' )
type33 = TypeAsset.create( id: 33, type_asset_name: 'DUMP TRUCK 8M' )
type34 = TypeAsset.create( id: 34, type_asset_name: 'DYANE' )
type35 = TypeAsset.create( id: 35, type_asset_name: 'EARTHWORK ROLLER' )
type36 = TypeAsset.create( id: 36, type_asset_name: 'ELECTRIC SAW' )
type37 = TypeAsset.create( id: 37, type_asset_name: 'ELECTRICAL-JACK HAMMER' )
type38 = TypeAsset.create( id: 38, type_asset_name: 'EXCAVATOR' )
type39 = TypeAsset.create( id: 39, type_asset_name: 'FLATBED' )
type40 = TypeAsset.create( id: 40, type_asset_name: 'FORKLIFT' )
type41 = TypeAsset.create( id: 41, type_asset_name: 'GENERATOR' )
type42 = TypeAsset.create( id: 42, type_asset_name: 'GENERATOR SITE LIGHT' )
type43 = TypeAsset.create( id: 43, type_asset_name: 'Gilson Sand Shaker' )
type44 = TypeAsset.create( id: 44, type_asset_name: 'GMM PUMP' )
type45 = TypeAsset.create( id: 45, type_asset_name: 'GRADER' )
type46 = TypeAsset.create( id: 46, type_asset_name: 'HAND ROLLER' )
type47 = TypeAsset.create( id: 47, type_asset_name: 'HOSE PRESSING MACHINE' )
type48 = TypeAsset.create( id: 48, type_asset_name: 'HYD.JACK HAMMER' )
type49 = TypeAsset.create( id: 49, type_asset_name: 'HYDRO METAR' )
type50 = TypeAsset.create( id: 50, type_asset_name: 'HYDROMETER TEST' )
type51 = TypeAsset.create( id: 51, type_asset_name: 'IMPACT CRUSHER' )
type52 = TypeAsset.create( id: 52, type_asset_name: 'JAW CRUSHER' )
type53 = TypeAsset.create( id: 53, type_asset_name: 'JEEP' )
type54 = TypeAsset.create( id: 54, type_asset_name: 'LATHE MACHINE' )
type55 = TypeAsset.create( id: 55, type_asset_name: 'LINE BORING MACHINE' )
type56 = TypeAsset.create( id: 56, type_asset_name: 'LOWBED LONG CHASSIS' )
type57 = TypeAsset.create( id: 57, type_asset_name: 'LOWBED SMALL' )
type58 = TypeAsset.create( id: 58, type_asset_name: 'MATEST CBR' )
type59 = TypeAsset.create( id: 59, type_asset_name: 'MC1 sprayers' )
type60 = TypeAsset.create( id: 60, type_asset_name: 'MC1 TANK - STATIONARY' )
type61 = TypeAsset.create( id: 61, type_asset_name: 'MC1 TANK BIG - STATIONARY' )
type62 = TypeAsset.create( id: 62, type_asset_name: 'MILLING MACHINE' )
type63 = TypeAsset.create( id: 63, type_asset_name: 'PAVER' )
type64 = TypeAsset.create( id: 64, type_asset_name: 'PETROMIN TANK - STATIONARY' )
type65 = TypeAsset.create( id: 65, type_asset_name: 'PICK UP DOUBLE CABIN' )
type66 = TypeAsset.create( id: 66, type_asset_name: 'PICKUP SINGLE CAPIN' )
type67 = TypeAsset.create( id: 67, type_asset_name: 'PLATE COMPACTOR' )
type68 = TypeAsset.create( id: 68, type_asset_name: 'PNEUMATIC- JACK HAMMER' )
type69 = TypeAsset.create( id: 69, type_asset_name: 'PORTABLE CABIN' )
type70 = TypeAsset.create( id: 70, type_asset_name: 'POWER LOAD BANK' )
type71 = TypeAsset.create( id: 71, type_asset_name: 'RC2 TANK - STATIONARY' )
type72 = TypeAsset.create( id: 72, type_asset_name: 'RC2 TANK BIG - STATIONARY' )
type73 = TypeAsset.create( id: 73, type_asset_name: 'SAND EQUIVALENT' )
type74 = TypeAsset.create( id: 74, type_asset_name: 'AUTOMATIC SAND EQ. SHAKER' )
type75 = TypeAsset.create( id: 75, type_asset_name: 'SCISSORS LIFT' )
type76 = TypeAsset.create( id: 76, type_asset_name: 'SCREEN CRUSHER' )
type77 = TypeAsset.create( id: 77, type_asset_name: 'SEDAN' )
type78 = TypeAsset.create( id: 78, type_asset_name: 'SILO' )
type79 = TypeAsset.create( id: 79, type_asset_name: 'SKID LOADER' )
type80 = TypeAsset.create( id: 80, type_asset_name: 'SKID STEER' )
type81 = TypeAsset.create( id: 81, type_asset_name: 'SMALL GENERATOR' )
type82 = TypeAsset.create( id: 82, type_asset_name: 'Steel cutter' )
type83 = TypeAsset.create( id: 83, type_asset_name: 'Steel Die' )
type84 = TypeAsset.create( id: 84, type_asset_name: 'STEEL ROLLER' )
type85 = TypeAsset.create( id: 85, type_asset_name: 'SWEEPER' )
type86 = TypeAsset.create( id: 86, type_asset_name: 'SWEEPING MACHINE' )
type87 = TypeAsset.create( id: 87, type_asset_name: 'Tensile tester' )
type88 = TypeAsset.create( id: 88, type_asset_name: 'TIRAL HEAD 4X2' )
type89 = TypeAsset.create( id: 89, type_asset_name: 'TIRAL HEAD 6X4' )
type90 = TypeAsset.create( id: 90, type_asset_name: 'TIRE ROLLER' )
type91 = TypeAsset.create( id: 91, type_asset_name: 'TRAILER HEAD 4X2' )
type92 = TypeAsset.create( id: 92, type_asset_name: 'TRAILER HEAD 6X4' )
type93 = TypeAsset.create( id: 93, type_asset_name: 'TROLLEY' )
type94 = TypeAsset.create( id: 94, type_asset_name: 'VACUUM SWEEPER' )
type95 = TypeAsset.create( id: 95, type_asset_name: 'VAN' )
type96 = TypeAsset.create( id: 96, type_asset_name: 'Vertical Drill' )
type97 = TypeAsset.create( id: 97, type_asset_name: 'WASHER MACHINE' )
type98 = TypeAsset.create( id: 98, type_asset_name: 'WATER PUMP' )
type99 = TypeAsset.create( id: 99, type_asset_name: 'WATER PUMP BIG' )
type100 = TypeAsset.create( id: 100, type_asset_name: 'WATER PUMP SMALL' )
type101 = TypeAsset.create( id: 101, type_asset_name: 'WATER TANK - STATIONARY' )
type102 = TypeAsset.create( id: 102, type_asset_name: 'WATER TANK MOVABLE' )
type103 = TypeAsset.create( id: 103, type_asset_name: 'WATER TANKER TRUCK' )
type104 = TypeAsset.create( id: 104, type_asset_name: 'WElDING MACHINE' )
type105 = TypeAsset.create( id: 105, type_asset_name: 'WELDING MACHINE - DIESEL' )
type106 = TypeAsset.create( id: 106, type_asset_name: 'WELDING MACHINE - ELECTRIC' )
type107 = TypeAsset.create( id: 107, type_asset_name: 'WHEEL LOADER' )
type108 = TypeAsset.create( id: 108, type_asset_name: 'WHEEL SAW TRUNCH' )
type109 = TypeAsset.create( id: 109, type_asset_name: 'WRECKER TRUCK' )
type110 = TypeAsset.create( id: 110, type_asset_name: 'CBR AND MARSHELL/M' )
type111 = TypeAsset.create( id: 111, type_asset_name: 'BITUMIN TANK' )
type112 = TypeAsset.create( id: 112, type_asset_name: 'CABRIK MACHINE' )
type113 = TypeAsset.create( id: 113, type_asset_name: 'P&D Machine' )




mod1 = ModelAsset.create( id: 1, model_asset_name: 'N/A' )

mod2 = ModelAsset.create( id: 2, model_asset_name: 'KAESER' )
mod3 = ModelAsset.create( id: 3, model_asset_name: 'XAS 185' )
mod4 = ModelAsset.create( id: 4, model_asset_name: 'XAS 96' )
mod5 = ModelAsset.create( id: 5, model_asset_name: 'XAS 97' )
mod6 = ModelAsset.create( id: 6, model_asset_name: 'ROBIN' )
mod7 = ModelAsset.create( id: 7, model_asset_name: 'HYUNDAI' )
mod8 = ModelAsset.create( id: 8, model_asset_name: 'C129X' )
mod9 = ModelAsset.create( id: 9, model_asset_name: 'EY40' )
mod10 = ModelAsset.create( id: 10, model_asset_name: 'MANN' )
mod11 = ModelAsset.create( id: 11, model_asset_name: 'MERCEDES 24' )
mod12 = ModelAsset.create( id: 12, model_asset_name: 'ACTROS' )
mod13 = ModelAsset.create( id: 13, model_asset_name: '2536' )
mod14 = ModelAsset.create( id: 14, model_asset_name: 'MARINI M40' )
mod15 = ModelAsset.create( id: 15, model_asset_name: 'FULLINHALT' )
mod16 = ModelAsset.create( id: 16, model_asset_name: 'CAT 416B' )
mod17 = ModelAsset.create( id: 17, model_asset_name: 'CAT 422E' )
mod18 = ModelAsset.create( id: 18, model_asset_name: 'CAT 424D' )
mod19 = ModelAsset.create( id: 19, model_asset_name: 'CAT 428C' )
mod20 = ModelAsset.create( id: 20, model_asset_name: 'CAT 428E' )
mod21 = ModelAsset.create( id: 21, model_asset_name: 'CAT 428F' )
mod22 = ModelAsset.create( id: 22, model_asset_name: 'CLASS BOOSTER 5000' )
mod23 = ModelAsset.create( id: 23, model_asset_name: 'CLASS 300E' )
mod24 = ModelAsset.create( id: 24, model_asset_name: 'CLASS 350E' )
mod25 = ModelAsset.create( id: 25, model_asset_name: 'CLASS 4500' )
mod26 = ModelAsset.create( id: 26, model_asset_name: 'BLITZ 550' )
mod27 = ModelAsset.create( id: 27, model_asset_name: 'HD 260' )
mod28 = ModelAsset.create( id: 28, model_asset_name: '2631' )
mod29 = ModelAsset.create( id: 29, model_asset_name: '1841' )
mod30 = ModelAsset.create( id: 30, model_asset_name: '2412' )
mod31 = ModelAsset.create( id: 31, model_asset_name: '2521' )
mod32 = ModelAsset.create( id: 32, model_asset_name: '1935' )
mod33 = ModelAsset.create( id: 33, model_asset_name: '2640' )
mod34 = ModelAsset.create( id: 34, model_asset_name: '2635' )
mod35 = ModelAsset.create( id: 35, model_asset_name: 'KOMATSU D155A' )
mod36 = ModelAsset.create( id: 36, model_asset_name: 'CAT D8R' )
mod37 = ModelAsset.create( id: 37, model_asset_name: 'CAT D6H' )
mod38 = ModelAsset.create( id: 38, model_asset_name: 'CAT D6D' )
mod39 = ModelAsset.create( id: 39, model_asset_name: 'CAT D9R' )
mod40 = ModelAsset.create( id: 40, model_asset_name: 'BOMAG BW212D30' )
mod41 = ModelAsset.create( id: 41, model_asset_name: 'KOMATSU D275A' )
mod42 = ModelAsset.create( id: 42, model_asset_name: 'TOYOTA' )
mod43 = ModelAsset.create( id: 43, model_asset_name: 'NISSAN' )
mod44 = ModelAsset.create( id: 44, model_asset_name: 'CARRIER' )
mod45 = ModelAsset.create( id: 45, model_asset_name: 'ICESTA' )
mod46 = ModelAsset.create( id: 46, model_asset_name: '3236' )
mod47 = ModelAsset.create( id: 47, model_asset_name: 'LB' )
mod48 = ModelAsset.create( id: 48, model_asset_name: '1995' )
mod49 = ModelAsset.create( id: 49, model_asset_name: '2628' )
mod50 = ModelAsset.create( id: 50, model_asset_name: '3229' )
mod51 = ModelAsset.create( id: 51, model_asset_name: '3234' )
mod52 = ModelAsset.create( id: 52, model_asset_name: '3241' )
mod53 = ModelAsset.create( id: 53, model_asset_name: '3328' )
mod54 = ModelAsset.create( id: 54, model_asset_name: '3536' )
mod55 = ModelAsset.create( id: 55, model_asset_name: 'NFLG' )
mod56 = ModelAsset.create( id: 56, model_asset_name: 'ELBA' )
mod57 = ModelAsset.create( id: 57, model_asset_name: 'HZS100X14' )
mod58 = ModelAsset.create( id: 58, model_asset_name: 'JS1500C' )
mod59 = ModelAsset.create( id: 59, model_asset_name: 'CHINE' )
mod60 = ModelAsset.create( id: 60, model_asset_name: '1996' )
mod61 = ModelAsset.create( id: 61, model_asset_name: 'HZS75X18' )
mod62 = ModelAsset.create( id: 62, model_asset_name: 'AL6A' )
mod63 = ModelAsset.create( id: 63, model_asset_name: '1722' )
mod64 = ModelAsset.create( id: 64, model_asset_name: '1726' )
mod65 = ModelAsset.create( id: 65, model_asset_name: '1735' )
mod66 = ModelAsset.create( id: 66, model_asset_name: '1748' )
mod67 = ModelAsset.create( id: 67, model_asset_name: '1838' )
mod68 = ModelAsset.create( id: 68, model_asset_name: '1844' )
mod69 = ModelAsset.create( id: 69, model_asset_name: '1924' )
mod70 = ModelAsset.create( id: 70, model_asset_name: '1928' )
mod71 = ModelAsset.create( id: 71, model_asset_name: '1975' )
mod72 = ModelAsset.create( id: 72, model_asset_name: '1976' )
mod73 = ModelAsset.create( id: 73, model_asset_name: '1977' )
mod74 = ModelAsset.create( id: 74, model_asset_name: '1979' )
mod75 = ModelAsset.create( id: 75, model_asset_name: '1990' )
mod76 = ModelAsset.create( id: 76, model_asset_name: '2012' )
mod77 = ModelAsset.create( id: 77, model_asset_name: '2038' )
mod78 = ModelAsset.create( id: 78, model_asset_name: '2040' )
mod79 = ModelAsset.create( id: 79, model_asset_name: '2041' )
mod80 = ModelAsset.create( id: 80, model_asset_name: '2396' )
mod81 = ModelAsset.create( id: 81, model_asset_name: '2624' )
mod82 = ModelAsset.create( id: 82, model_asset_name: '2629' )
mod83 = ModelAsset.create( id: 83, model_asset_name: '2636' )
mod84 = ModelAsset.create( id: 84, model_asset_name: '2638' )
mod85 = ModelAsset.create( id: 85, model_asset_name: '4040' )
mod86 = ModelAsset.create( id: 86, model_asset_name: '1D' )
mod87 = ModelAsset.create( id: 87, model_asset_name: '2D' )
mod88 = ModelAsset.create( id: 88, model_asset_name: '300D' )
mod89 = ModelAsset.create( id: 89, model_asset_name: '3M' )
mod90 = ModelAsset.create( id: 90, model_asset_name: '400CX' )
mod91 = ModelAsset.create( id: 91, model_asset_name: '4D' )
mod92 = ModelAsset.create( id: 92, model_asset_name: '500D' )
mod93 = ModelAsset.create( id: 93, model_asset_name: '500X' )
mod94 = ModelAsset.create( id: 94, model_asset_name: '602D' )
mod95 = ModelAsset.create( id: 95, model_asset_name: '65H' )
mod96 = ModelAsset.create( id: 96, model_asset_name: 'ABG7820B' )
mod97 = ModelAsset.create( id: 97, model_asset_name: 'AV1XL' )
mod98 = ModelAsset.create( id: 98, model_asset_name: 'PATHFINDER' )
mod99 = ModelAsset.create( id: 99, model_asset_name: 'BLAIZER' )
mod100 = ModelAsset.create( id: 100, model_asset_name: 'BLUE 500D' )
mod101 = ModelAsset.create( id: 101, model_asset_name: 'BOMAG 5774' )
mod102 = ModelAsset.create( id: 102, model_asset_name: 'BOMAG BF691C' )
mod103 = ModelAsset.create( id: 103, model_asset_name: 'BOMAG BW212D-2' )
mod104 = ModelAsset.create( id: 104, model_asset_name: 'BOMAG BW212D-3' )
mod105 = ModelAsset.create( id: 105, model_asset_name: 'BOMAG BW212D-40' )
mod106 = ModelAsset.create( id: 106, model_asset_name: 'BROADWAY' )
mod107 = ModelAsset.create( id: 107, model_asset_name: 'BW65H' )
mod108 = ModelAsset.create( id: 108, model_asset_name: 'BWEB0X500X' )
mod109 = ModelAsset.create( id: 109, model_asset_name: 'BX 1315' )
mod110 = ModelAsset.create( id: 110, model_asset_name: 'BX 1400' )
mod111 = ModelAsset.create( id: 111, model_asset_name: 'BX 1500' )
mod112 = ModelAsset.create( id: 112, model_asset_name: 'BX1-315' )
mod113 = ModelAsset.create( id: 113, model_asset_name: 'CAMRY' )
mod114 = ModelAsset.create( id: 114, model_asset_name: 'CAT CW34' )
mod115 = ModelAsset.create( id: 115, model_asset_name: 'CAT PM200' )
mod116 = ModelAsset.create( id: 116, model_asset_name: 'CAT 966G' )
mod117 = ModelAsset.create( id: 117, model_asset_name: 'CAT 966F' )
mod118 = ModelAsset.create( id: 118, model_asset_name: 'CAT 936F' )
mod119 = ModelAsset.create( id: 119, model_asset_name: 'CAT 950B' )
mod120 = ModelAsset.create( id: 120, model_asset_name: 'CAT 950C' )
mod121 = ModelAsset.create( id: 121, model_asset_name: 'CAT 966D' )
mod122 = ModelAsset.create( id: 122, model_asset_name: 'CAT 910B' )
mod123 = ModelAsset.create( id: 123, model_asset_name: 'CAT 910' )
mod124 = ModelAsset.create( id: 124, model_asset_name: 'CAT 916' )
mod125 = ModelAsset.create( id: 125, model_asset_name: 'CAT 950F' )
mod126 = ModelAsset.create( id: 126, model_asset_name: 'CAT 966E' )
mod127 = ModelAsset.create( id: 127, model_asset_name: 'CAT 920' )
mod128 = ModelAsset.create( id: 128, model_asset_name: 'CAT 936E' )
mod129 = ModelAsset.create( id: 129, model_asset_name: 'Cheverolet' )
mod130 = ModelAsset.create( id: 130, model_asset_name: 'CAT 950G' )
mod131 = ModelAsset.create( id: 131, model_asset_name: 'CAT 926E' )
mod132 = ModelAsset.create( id: 132, model_asset_name: 'CAT 936' )
mod133 = ModelAsset.create( id: 133, model_asset_name: 'CAT 950E' )
mod134 = ModelAsset.create( id: 134, model_asset_name: 'CAT 996E' )
mod135 = ModelAsset.create( id: 135, model_asset_name: 'CAT 980G' )
mod136 = ModelAsset.create( id: 136, model_asset_name: 'CAT 972G' )
mod137 = ModelAsset.create( id: 137, model_asset_name: 'CAT 980C' )
mod138 = ModelAsset.create( id: 138, model_asset_name: 'CM13' )
mod139 = ModelAsset.create( id: 139, model_asset_name: 'CAT 938G' )
mod140 = ModelAsset.create( id: 140, model_asset_name: 'CAT XG932III' )
mod141 = ModelAsset.create( id: 141, model_asset_name: 'CAT 932' )
mod142 = ModelAsset.create( id: 142, model_asset_name: 'COROLLA' )
mod143 = ModelAsset.create( id: 143, model_asset_name: 'CAT 938F' )
mod144 = ModelAsset.create( id: 144, model_asset_name: 'CAT 928F' )
mod145 = ModelAsset.create( id: 145, model_asset_name: 'CAT 930' )
mod146 = ModelAsset.create( id: 146, model_asset_name: 'CAT CS531D' )
mod147 = ModelAsset.create( id: 147, model_asset_name: 'CAT CS-533E' )
mod148 = ModelAsset.create( id: 148, model_asset_name: 'CAT CS5332' )
mod149 = ModelAsset.create( id: 149, model_asset_name: 'CAT CS533E' )
mod150 = ModelAsset.create( id: 150, model_asset_name: 'CAT 14G' )
mod151 = ModelAsset.create( id: 151, model_asset_name: 'CAT 14H' )
mod152 = ModelAsset.create( id: 152, model_asset_name: 'CUMMINS' )
mod153 = ModelAsset.create( id: 153, model_asset_name: 'CAT 12G' )
mod154 = ModelAsset.create( id: 154, model_asset_name: 'CAT 140G' )
mod155 = ModelAsset.create( id: 155, model_asset_name: 'CAT 160H' )
mod156 = ModelAsset.create( id: 156, model_asset_name: 'CAT 12H' )
mod157 = ModelAsset.create( id: 157, model_asset_name: 'CAT 160M' )
mod158 = ModelAsset.create( id: 158, model_asset_name: 'CAT 14M' )
mod159 = ModelAsset.create( id: 159, model_asset_name: 'DC67 200HP' )
mod160 = ModelAsset.create( id: 160, model_asset_name: 'CAT 140H' )
mod161 = ModelAsset.create( id: 161, model_asset_name: 'CAT 320DL' )
mod162 = ModelAsset.create( id: 162, model_asset_name: 'CAT 320BL' )
mod163 = ModelAsset.create( id: 163, model_asset_name: 'CAT 200L' )
mod164 = ModelAsset.create( id: 164, model_asset_name: 'CAT 3412' )
mod165 = ModelAsset.create( id: 165, model_asset_name: 'CAT 3208' )
mod166 = ModelAsset.create( id: 166, model_asset_name: 'CAT 3406' )
mod167 = ModelAsset.create( id: 167, model_asset_name: 'CAT 3304' )
mod168 = ModelAsset.create( id: 168, model_asset_name: 'CAT 3306' )
mod169 = ModelAsset.create( id: 169, model_asset_name: 'DENTZ' )
mod170 = ModelAsset.create( id: 170, model_asset_name: 'CAT 3408' )
mod171 = ModelAsset.create( id: 171, model_asset_name: 'CAT 1929' )
mod172 = ModelAsset.create( id: 172, model_asset_name: 'CAT 3406B' )
mod173 = ModelAsset.create( id: 173, model_asset_name: 'DEUTZ F4L912' )
mod174 = ModelAsset.create( id: 174, model_asset_name: 'CAT 3512' )
mod175 = ModelAsset.create( id: 175, model_asset_name: 'CAT 3304B' )
mod176 = ModelAsset.create( id: 176, model_asset_name: 'DYNAPAC 9009R' )
mod177 = ModelAsset.create( id: 177, model_asset_name: 'EC7' )
mod178 = ModelAsset.create( id: 178, model_asset_name: 'CAT U147254P' )
mod179 = ModelAsset.create( id: 179, model_asset_name: 'EDGE' )
mod180 = ModelAsset.create( id: 180, model_asset_name: 'CAT QX100' )
mod181 = ModelAsset.create( id: 181, model_asset_name: 'CAT DP30NT' )
mod182 = ModelAsset.create( id: 182, model_asset_name: 'CAT TH460C' )
mod183 = ModelAsset.create( id: 183, model_asset_name: 'CAT TH460B' )
mod184 = ModelAsset.create( id: 184, model_asset_name: 'CAT TH62' )
mod185 = ModelAsset.create( id: 185, model_asset_name: 'CAT FD30NT' )
mod186 = ModelAsset.create( id: 186, model_asset_name: 'CAT 226' )
mod187 = ModelAsset.create( id: 187, model_asset_name: 'CAT 753' )
mod188 = ModelAsset.create( id: 188, model_asset_name: 'CAT 216' )
mod189 = ModelAsset.create( id: 189, model_asset_name: 'CAT 752' )
mod190 = ModelAsset.create( id: 190, model_asset_name: 'CAT 763' )
mod191 = ModelAsset.create( id: 191, model_asset_name: 'CAT S150' )
mod192 = ModelAsset.create( id: 192, model_asset_name: 'CAT S160' )
mod193 = ModelAsset.create( id: 193, model_asset_name: 'CAT 246' )
mod194 = ModelAsset.create( id: 194, model_asset_name: 'CAT CB534D' )
mod195 = ModelAsset.create( id: 195, model_asset_name: 'CAT CB14B' )
mod196 = ModelAsset.create( id: 196, model_asset_name: 'CAT CS-531D' )
mod197 = ModelAsset.create( id: 197, model_asset_name: 'CAT SG14' )
mod198 = ModelAsset.create( id: 198, model_asset_name: 'CAT 330DL' )
mod199 = ModelAsset.create( id: 199, model_asset_name: 'CAT 323DL' )
mod200 = ModelAsset.create( id: 200, model_asset_name: 'ENVOY' )
mod201 = ModelAsset.create( id: 201, model_asset_name: 'ETF12609' )
mod202 = ModelAsset.create( id: 202, model_asset_name: 'CAT 3406C' )
mod203 = ModelAsset.create( id: 203, model_asset_name: 'CAT 3508' )
mod204 = ModelAsset.create( id: 204, model_asset_name: 'CAT 70KW' )
mod205 = ModelAsset.create( id: 205, model_asset_name: 'CAT LPW4' )
mod206 = ModelAsset.create( id: 206, model_asset_name: 'CAT 3406D-I' )
mod207 = ModelAsset.create( id: 207, model_asset_name: 'CAT C15' )
mod208 = ModelAsset.create( id: 208, model_asset_name: 'CAT 400' )
mod209 = ModelAsset.create( id: 209, model_asset_name: 'CAT 33TG1' )
mod210 = ModelAsset.create( id: 210, model_asset_name: 'CAT 3416' )
mod211 = ModelAsset.create( id: 211, model_asset_name: 'CAT DP50CN' )
mod212 = ModelAsset.create( id: 212, model_asset_name: 'CAT SF50' )
mod213 = ModelAsset.create( id: 213, model_asset_name: 'ETF13955' )
mod214 = ModelAsset.create( id: 214, model_asset_name: 'EXPLORER' )
mod215 = ModelAsset.create( id: 215, model_asset_name: 'EY20' )
mod216 = ModelAsset.create( id: 216, model_asset_name: 'F4L2011' )
mod217 = ModelAsset.create( id: 217, model_asset_name: 'FORTUNER' )
mod218 = ModelAsset.create( id: 218, model_asset_name: 'FORUKAWA' )
mod219 = ModelAsset.create( id: 219, model_asset_name: 'GEELY' )
mod220 = ModelAsset.create( id: 220, model_asset_name: 'GMC' )
mod221 = ModelAsset.create( id: 221, model_asset_name: 'HINO' )
mod222 = ModelAsset.create( id: 222, model_asset_name: 'ISUZU' )
mod223 = ModelAsset.create( id: 223, model_asset_name: 'JAC' )
mod224 = ModelAsset.create( id: 224, model_asset_name: 'SAKAI LP6500' )
mod225 = ModelAsset.create( id: 225, model_asset_name: 'GX 7' )
mod226 = ModelAsset.create( id: 226, model_asset_name: 'WACKER RD7H-S' )
mod227 = ModelAsset.create( id: 227, model_asset_name: 'HAMM DV8' )
mod228 = ModelAsset.create( id: 228, model_asset_name: 'PF-1316' )
mod229 = ModelAsset.create( id: 229, model_asset_name: 'SYMONS' )
mod230 = ModelAsset.create( id: 230, model_asset_name: 'SYM 425' )
mod231 = ModelAsset.create( id: 231, model_asset_name: 'VOGELE 1700' )
mod232 = ModelAsset.create( id: 232, model_asset_name: 'VOGELE 1800' )
mod233 = ModelAsset.create( id: 233, model_asset_name: 'HAMM GRW 18' )
mod234 = ModelAsset.create( id: 234, model_asset_name: 'INGERSOLL PT240R' )
mod235 = ModelAsset.create( id: 235, model_asset_name: 'HAMM HD110' )
mod236 = ModelAsset.create( id: 236, model_asset_name: 'SHANTUI SL20W' )
mod237 = ModelAsset.create( id: 237, model_asset_name: 'INGERSOL SD-100D' )
mod238 = ModelAsset.create( id: 238, model_asset_name: 'SHANTUI SG14' )
mod239 = ModelAsset.create( id: 239, model_asset_name: 'KOMATSU PC200' )
mod240 = ModelAsset.create( id: 240, model_asset_name: 'PERKINS DM50pm' )
mod241 = ModelAsset.create( id: 241, model_asset_name: 'KOBUTA J318' )
mod242 = ModelAsset.create( id: 242, model_asset_name: 'KOBUTA J324' )
mod243 = ModelAsset.create( id: 243, model_asset_name: 'KOBUTA 3406' )
mod244 = ModelAsset.create( id: 244, model_asset_name: 'HAWKAWK SPG30' )
mod245 = ModelAsset.create( id: 245, model_asset_name: 'PERKINS 24KVA' )
mod246 = ModelAsset.create( id: 246, model_asset_name: 'PERKINS GV51790U' )
mod247 = ModelAsset.create( id: 247, model_asset_name: 'PERKINS DM53PM' )
mod248 = ModelAsset.create( id: 248, model_asset_name: 'KOBUTA J313' )
mod249 = ModelAsset.create( id: 249, model_asset_name: 'KOBUTA J24' )
mod250 = ModelAsset.create( id: 250, model_asset_name: 'KOBUTA J327' )
mod251 = ModelAsset.create( id: 251, model_asset_name: 'PERKINS' )
mod252 = ModelAsset.create( id: 252, model_asset_name: 'LAND CRUSER' )
mod253 = ModelAsset.create( id: 253, model_asset_name: 'TOYOTA-PRADO' )
mod254 = ModelAsset.create( id: 254, model_asset_name: 'VOGELE 1800-I' )
mod255 = ModelAsset.create( id: 255, model_asset_name: 'HAMM TV80' )
mod256 = ModelAsset.create( id: 256, model_asset_name: 'YARIS' )
mod257 = ModelAsset.create( id: 257, model_asset_name: 'RAV 4' )
mod258 = ModelAsset.create( id: 258, model_asset_name: 'TAHOE' )
mod259 = ModelAsset.create( id: 259, model_asset_name: 'Hyundai-Tusan' )
mod260 = ModelAsset.create( id: 260, model_asset_name: 'HAMM MBV' )
mod261 = ModelAsset.create( id: 261, model_asset_name: 'RGX4800' )
mod262 = ModelAsset.create( id: 262, model_asset_name: 'NTC EB6500NE' )
mod263 = ModelAsset.create( id: 263, model_asset_name: 'LTN6' )
mod264 = ModelAsset.create( id: 264, model_asset_name: 'HFC3046K' )
mod265 = ModelAsset.create( id: 265, model_asset_name: 'HV80' )
mod266 = ModelAsset.create( id: 266, model_asset_name: 'HZS75X17' )
mod267 = ModelAsset.create( id: 267, model_asset_name: 'INGERSOLL 9820' )
mod268 = ModelAsset.create( id: 268, model_asset_name: 'K1278-10' )
mod269 = ModelAsset.create( id: 269, model_asset_name: 'K2410' )
mod270 = ModelAsset.create( id: 270, model_asset_name: 'KATU' )
mod271 = ModelAsset.create( id: 271, model_asset_name: 'Hyundai-Tuscon' )
mod272 = ModelAsset.create( id: 272, model_asset_name: 'KOBUTA SQ3350' )
mod273 = ModelAsset.create( id: 273, model_asset_name: 'KOMATSU WA500' )
mod274 = ModelAsset.create( id: 274, model_asset_name: 'S2000' )
mod275 = ModelAsset.create( id: 275, model_asset_name: 'TA 20/500DZ' )
mod276 = ModelAsset.create( id: 276, model_asset_name: 'MARQUIS' )
mod277 = ModelAsset.create( id: 277, model_asset_name: 'MAXIMA' )
mod278 = ModelAsset.create( id: 278, model_asset_name: 'Miller' )
mod279 = ModelAsset.create( id: 279, model_asset_name: 'SA250' )
mod280 = ModelAsset.create( id: 280, model_asset_name: 'SAE400' )
mod281 = ModelAsset.create( id: 281, model_asset_name: 'Liberty' )
mod282 = ModelAsset.create( id: 282, model_asset_name: 'LISTER' )
mod283 = ModelAsset.create( id: 283, model_asset_name: 'LP6500' )
mod284 = ModelAsset.create( id: 284, model_asset_name: 'M-Grand' )
mod285 = ModelAsset.create( id: 285, model_asset_name: 'MAKITA' )
mod286 = ModelAsset.create( id: 286, model_asset_name: 'MBU SIHEID RW210' )
mod287 = ModelAsset.create( id: 287, model_asset_name: 'NITRO' )
mod288 = ModelAsset.create( id: 288, model_asset_name: 'Shroki' )
mod289 = ModelAsset.create( id: 289, model_asset_name: 'SEQUOIA' )
mod290 = ModelAsset.create( id: 290, model_asset_name: 'ZY 240' )
mod291 = ModelAsset.create( id: 291, model_asset_name: 'OLYMPIAN GCD325' )
mod292 = ModelAsset.create( id: 292, model_asset_name: 'SANTAFE' )
mod293 = ModelAsset.create( id: 293, model_asset_name: '897282245' )
mod294 = ModelAsset.create( id: 294, model_asset_name: 'NT 855GS' )
mod295 = ModelAsset.create( id: 295, model_asset_name: 'MITSUBISHI' )
mod296 = ModelAsset.create( id: 296, model_asset_name: 'MEIWA KP80' )
mod297 = ModelAsset.create( id: 297, model_asset_name: 'MSAS 200' )
mod298 = ModelAsset.create( id: 298, model_asset_name: 'SHAKLIMAN' )
mod299 = ModelAsset.create( id: 299, model_asset_name: 'SOOSAN' )
mod300 = ModelAsset.create( id: 300, model_asset_name: 'RW24' )
mod301 = ModelAsset.create( id: 301, model_asset_name: 'NIC1817-4' )
mod302 = ModelAsset.create( id: 302, model_asset_name: 'NRG5500GX' )
mod303 = ModelAsset.create( id: 303, model_asset_name: 'PE 750 X1060' )
mod304 = ModelAsset.create( id: 304, model_asset_name: 'PEJOW' )
mod305 = ModelAsset.create( id: 305, model_asset_name: 'PLANT 70B' )
mod306 = ModelAsset.create( id: 306, model_asset_name: 'SENTAVI' )
mod307 = ModelAsset.create( id: 307, model_asset_name: 'PI49P' )
mod308 = ModelAsset.create( id: 308, model_asset_name: 'QLT-M10' )
mod309 = ModelAsset.create( id: 309, model_asset_name: 'RD7HS' )
mod310 = ModelAsset.create( id: 310, model_asset_name: 'RGX2900' )
mod311 = ModelAsset.create( id: 311, model_asset_name: 'S213N' )
mod312 = ModelAsset.create( id: 312, model_asset_name: 'SLT18MD' )
mod313 = ModelAsset.create( id: 313, model_asset_name: 'VOGELE 1800-2' )
mod314 = ModelAsset.create( id: 314, model_asset_name: 'VOGELE 1800-3' )
mod315 = ModelAsset.create( id: 315, model_asset_name: 'PERKINS DK51278' )
mod316 = ModelAsset.create( id: 316, model_asset_name: 'PERKINS DM24PS' )
mod317 = ModelAsset.create( id: 317, model_asset_name: 'PERKINS DM68PI - 68KV' )
mod318 = ModelAsset.create( id: 318, model_asset_name: 'PERKINS P149P' )
mod319 = ModelAsset.create( id: 319, model_asset_name: 'PERKINS DM24' )
mod320 = ModelAsset.create( id: 320, model_asset_name: 'PERKINS 50KVA' )
mod321 = ModelAsset.create( id: 321, model_asset_name: 'PERKINS 23KVA' )
mod322 = ModelAsset.create( id: 322, model_asset_name: 'PERKINS DK32037' )
mod323 = ModelAsset.create( id: 323, model_asset_name: 'webaw' )
mod324 = ModelAsset.create( id: 324, model_asset_name: 'ULTIMAP2700B5' )
mod325 = ModelAsset.create( id: 325, model_asset_name: 'ITALY' )
mod326 = ModelAsset.create( id: 326, model_asset_name: 'YOURK' )
mod327 = ModelAsset.create( id: 327, model_asset_name: 'ASQ100BLDBAAAA' )
mod328 = ModelAsset.create( id: 328, model_asset_name: '110KW' )
mod329 = ModelAsset.create( id: 329, model_asset_name: 'D-58' )
mod330 = ModelAsset.create( id: 330, model_asset_name: '1BAG' )
mod331 = ModelAsset.create( id: 331, model_asset_name: 'YPK-47' )
mod332 = ModelAsset.create( id: 332, model_asset_name: 'TITAN 9820' )
mod333 = ModelAsset.create( id: 333, model_asset_name: 'VOLVO 7820B' )
mod334 = ModelAsset.create( id: 334, model_asset_name: 'STAVOSTRAJ' )
mod335 = ModelAsset.create( id: 335, model_asset_name: 'HAMM GRW-15' )
mod336 = ModelAsset.create( id: 336, model_asset_name: 'HAMM GRW10' )
mod337 = ModelAsset.create( id: 337, model_asset_name: 'BOMAG BW20' )
mod338 = ModelAsset.create( id: 338, model_asset_name: 'D1HATSV' )
mod339 = ModelAsset.create( id: 339, model_asset_name: 'DYNAPAC CP22' )
mod340 = ModelAsset.create( id: 340, model_asset_name: 'DYNAPAC CA25' )
mod341 = ModelAsset.create( id: 341, model_asset_name: 'DYNAPAC CA250' )
mod342 = ModelAsset.create( id: 342, model_asset_name: 'DYNAPAC' )
mod343 = ModelAsset.create( id: 343, model_asset_name: 'CAT PM-200' )
mod344 = ModelAsset.create( id: 344, model_asset_name: 'WIRTGEN W1900' )
mod345 = ModelAsset.create( id: 345, model_asset_name: 'WIRTGEN W200' )
mod346 = ModelAsset.create( id: 346, model_asset_name: 'KOMATS WA320-1' )
mod347 = ModelAsset.create( id: 347, model_asset_name: 'WA250-1' )
mod348 = ModelAsset.create( id: 348, model_asset_name: 'CAT 226B' )
mod349 = ModelAsset.create( id: 349, model_asset_name: 'TUCSON' )
mod350 = ModelAsset.create( id: 350, model_asset_name: 'TG500E' )
mod351 = ModelAsset.create( id: 351, model_asset_name: 'V400' )
mod352 = ModelAsset.create( id: 352, model_asset_name: 'KOMATSU FD30NT' )
mod353 = ModelAsset.create( id: 353, model_asset_name: 'KOMATSU FD30T-12' )
mod354 = ModelAsset.create( id: 354, model_asset_name: '185CFM' )
mod355 = ModelAsset.create( id: 355, model_asset_name: '1383' )
mod356 = ModelAsset.create( id: 356, model_asset_name: '1981' )
mod357 = ModelAsset.create( id: 357, model_asset_name: 'AL4060D1' )
mod358 = ModelAsset.create( id: 358, model_asset_name: 'AL40000' )
mod359 = ModelAsset.create( id: 359, model_asset_name: 'ALLAS CAPCO' )
mod360 = ModelAsset.create( id: 360, model_asset_name: 'FAUN' )
mod361 = ModelAsset.create( id: 361, model_asset_name: '3406' )
mod362 = ModelAsset.create( id: 362, model_asset_name: 'KOMATSU PW170' )
mod363 = ModelAsset.create( id: 363, model_asset_name: 'DEUTZ F3L912' )
mod364 = ModelAsset.create( id: 364, model_asset_name: 'CAT 0671TA' )
mod365 = ModelAsset.create( id: 365, model_asset_name: 'KUBOTA' )
mod366 = ModelAsset.create( id: 366, model_asset_name: 'CAT 8LT18' )
mod367 = ModelAsset.create( id: 367, model_asset_name: 'GX7' )
mod368 = ModelAsset.create( id: 368, model_asset_name: 'XAS 175' )
mod369 = ModelAsset.create( id: 369, model_asset_name: 'BOMAG 212D-30' )
mod370 = ModelAsset.create( id: 370, model_asset_name: 'KOMATSU GD705A-4' )
mod371 = ModelAsset.create( id: 371, model_asset_name: 'DEUTZ F2L912' )
mod372 = ModelAsset.create( id: 372, model_asset_name: '382656' )
mod373 = ModelAsset.create( id: 373, model_asset_name: '65788' )
mod374 = ModelAsset.create( id: 374, model_asset_name: '1848' )
mod375 = ModelAsset.create( id: 375, model_asset_name: '281116' )
mod376 = ModelAsset.create( id: 376, model_asset_name: 'XAS 597' )
mod377 = ModelAsset.create( id: 377, model_asset_name: 'DNBELT2032' )
mod378 = ModelAsset.create( id: 378, model_asset_name: '150AJS11' )
mod379 = ModelAsset.create( id: 379, model_asset_name: 'LB069706' )
mod380 = ModelAsset.create( id: 380, model_asset_name: '250D3152' )
mod381 = ModelAsset.create( id: 381, model_asset_name: 'K1278-8' )
mod382 = ModelAsset.create( id: 382, model_asset_name: 'K1278-5' )
mod383 = ModelAsset.create( id: 383, model_asset_name: 'WMDC-0070' )
mod384 = ModelAsset.create( id: 384, model_asset_name: 'TEREX RT 230-1' )
mod385 = ModelAsset.create( id: 385, model_asset_name: '40ID' )
mod386 = ModelAsset.create( id: 386, model_asset_name: 'ZXS-630' )
mod387 = ModelAsset.create( id: 387, model_asset_name: 'ZXE1400' )
mod388 = ModelAsset.create( id: 388, model_asset_name: 'BX1-300-2' )
mod389 = ModelAsset.create( id: 389, model_asset_name: 'THF250' )
mod390 = ModelAsset.create( id: 390, model_asset_name: 'T6A36' )
mod391 = ModelAsset.create( id: 391, model_asset_name: 'WP1540-60' )
mod392 = ModelAsset.create( id: 392, model_asset_name: 'SW360B-160' )
mod393 = ModelAsset.create( id: 393, model_asset_name: 'T600' )
mod394 = ModelAsset.create( id: 394, model_asset_name: 'EY20D 6' )
mod395 = ModelAsset.create( id: 395, model_asset_name: '15601' )
mod396 = ModelAsset.create( id: 396, model_asset_name: '6 3.5' )
mod397 = ModelAsset.create( id: 397, model_asset_name: 'K600' )
mod398 = ModelAsset.create( id: 398, model_asset_name: 'UFO 550 ISTAR' )
mod399 = ModelAsset.create( id: 399, model_asset_name: '6 S.O HP' )
mod400 = ModelAsset.create( id: 400, model_asset_name: 'ATLAS COPCO' )
mod401 = ModelAsset.create( id: 401, model_asset_name: 'Expert' )
mod402 = ModelAsset.create( id: 402, model_asset_name: 'SE-2BF' )
mod403 = ModelAsset.create( id: 403, model_asset_name: 'T56' )
mod404 = ModelAsset.create( id: 404, model_asset_name: 'CONTROL' )
mod405 = ModelAsset.create( id: 405, model_asset_name: 'VOLVO ABG9820' )
mod406 = ModelAsset.create( id: 406, model_asset_name: 'HAMM GRW15' )
mod407 = ModelAsset.create( id: 407, model_asset_name: 'HAMM GRW5' )
mod408 = ModelAsset.create( id: 408, model_asset_name: 'HAMM HD90' )
mod409 = ModelAsset.create( id: 409, model_asset_name: 'HAMM HD120HV' )
mod410 = ModelAsset.create( id: 410, model_asset_name: '125-II' )
mod411 = ModelAsset.create( id: 411, model_asset_name: 'EOYELLE SL20W' )
mod412 = ModelAsset.create( id: 412, model_asset_name: 'VOLVO BL61B' )
mod413 = ModelAsset.create( id: 413, model_asset_name: 'CAT D6E-PS' )
mod414 = ModelAsset.create( id: 414, model_asset_name: 'NT 855' )
mod415 = ModelAsset.create( id: 415, model_asset_name: 'OLYMPIAN GEP150' )
mod416 = ModelAsset.create( id: 416, model_asset_name: 'OLYMPIAN GEH275' )
mod417 = ModelAsset.create( id: 417, model_asset_name: '1828' )
mod418 = ModelAsset.create( id: 418, model_asset_name: '1824' )
mod419 = ModelAsset.create( id: 419, model_asset_name: '1628' )
mod420 = ModelAsset.create( id: 420, model_asset_name: 'XAS 120' )
mod421 = ModelAsset.create( id: 421, model_asset_name: '2608' )
mod422 = ModelAsset.create( id: 422, model_asset_name: 'XAS 65' )
mod423 = ModelAsset.create( id: 423, model_asset_name: '1948' )
mod424 = ModelAsset.create( id: 424, model_asset_name: '1983' )
mod425 = ModelAsset.create( id: 425, model_asset_name: '32.24' )
mod426 = ModelAsset.create( id: 426, model_asset_name: '8000' )
mod427 = ModelAsset.create( id: 427, model_asset_name: 'WU600L' )
mod428 = ModelAsset.create( id: 428, model_asset_name: 'XAS 90' )
mod429 = ModelAsset.create( id: 429, model_asset_name: '1978' )
mod430 = ModelAsset.create( id: 430, model_asset_name: '1988' )
mod431 = ModelAsset.create( id: 431, model_asset_name: 'PRO18L' )
mod432 = ModelAsset.create( id: 432, model_asset_name: 'RP8575' )
mod433 = ModelAsset.create( id: 433, model_asset_name: 'PR018LG' )
mod434 = ModelAsset.create( id: 434, model_asset_name: 'ZY200' )
mod435 = ModelAsset.create( id: 435, model_asset_name: '1992' )
mod436 = ModelAsset.create( id: 436, model_asset_name: 'SEM6368' )
mod437 = ModelAsset.create( id: 437, model_asset_name: 'SEM6369' )
mod438 = ModelAsset.create( id: 438, model_asset_name: 'SEM6370' )
mod439 = ModelAsset.create( id: 439, model_asset_name: 'SEM6371' )
mod440 = ModelAsset.create( id: 440, model_asset_name: 'SEM6372' )
mod441 = ModelAsset.create( id: 441, model_asset_name: 'SEM6373' )
mod442 = ModelAsset.create( id: 442, model_asset_name: 'SEM6374' )
mod443 = ModelAsset.create( id: 443, model_asset_name: 'BOMAG BW212 D40' )
mod444 = ModelAsset.create( id: 444, model_asset_name: 'CAT' )
mod445 = ModelAsset.create( id: 445, model_asset_name: '1633' )
mod446 = ModelAsset.create( id: 446, model_asset_name: '1635' )
mod447 = ModelAsset.create( id: 447, model_asset_name: '2626' )
mod448 = ModelAsset.create( id: 448, model_asset_name: '1994' )
mod449 = ModelAsset.create( id: 449, model_asset_name: '1729' )
mod450 = ModelAsset.create( id: 450, model_asset_name: 'WA 470' )
mod451 = ModelAsset.create( id: 451, model_asset_name: 'CAT D155A-2' )
mod452 = ModelAsset.create( id: 452, model_asset_name: 'EW205D' )
mod453 = ModelAsset.create( id: 453, model_asset_name: 'TF120M' )
mod454 = ModelAsset.create( id: 454, model_asset_name: 'TR-450XL-1-0013' )
mod455 = ModelAsset.create( id: 455, model_asset_name: 'DK151278' )
mod456 = ModelAsset.create( id: 456, model_asset_name: 'J318-STD' )
mod457 = ModelAsset.create( id: 457, model_asset_name: 'BPL 900HDR-L' )
mod458 = ModelAsset.create( id: 458, model_asset_name: '1944' )
mod459 = ModelAsset.create( id: 459, model_asset_name: '2308' )
mod460 = ModelAsset.create( id: 460, model_asset_name: 'N1346' )
mod461 = ModelAsset.create( id: 461, model_asset_name: 'ZDMB16' )
mod462 = ModelAsset.create( id: 462, model_asset_name: 'N65S' )
mod463 = ModelAsset.create( id: 463, model_asset_name: '11162' )
mod464 = ModelAsset.create( id: 464, model_asset_name: 'BX1-630A' )




type1.model_assets << mod2
type1.model_assets << mod3
type1.model_assets << mod4
type1.model_assets << mod5
type1.model_assets << mod354
type1.model_assets << mod375
type1.model_assets << mod376
type1.model_assets << mod422
type1.model_assets << mod420
type1.model_assets << mod428
type1.model_assets << mod368

type2.model_assets << mod6

type3.model_assets << mod7

type4.model_assets << mod8

type5.model_assets << mod9
type5.model_assets << mod460

type6.model_assets << mod10
type6.model_assets << mod11
type6.model_assets << mod12
type6.model_assets << mod13

type7.model_assets << mod1
type7.model_assets << mod14
type7.model_assets << mod15
type7.model_assets << mod323
type7.model_assets << mod324
type7.model_assets << mod325

type8.model_assets << mod16
type8.model_assets << mod17
type8.model_assets << mod18
type8.model_assets << mod19
type8.model_assets << mod20
type8.model_assets << mod21
type8.model_assets << mod412

type9.model_assets << mod22
type9.model_assets << mod23
type9.model_assets << mod24
type9.model_assets << mod25
type9.model_assets << mod26
type9.model_assets << mod398

type10.model_assets << mod7
type10.model_assets << mod11
type10.model_assets << mod12
type10.model_assets << mod27
type10.model_assets << mod28
type10.model_assets << mod29
type10.model_assets << mod30
type10.model_assets << mod31
type10.model_assets << mod32
type10.model_assets << mod33
type10.model_assets << mod34

type11.model_assets << mod1

type12.model_assets << mod35
type12.model_assets << mod36
type12.model_assets << mod37
type12.model_assets << mod38
type12.model_assets << mod39
type12.model_assets << mod41
type12.model_assets << mod413
type12.model_assets << mod451

type13.model_assets << mod1

type14.model_assets << mod42
type14.model_assets << mod43

type15.model_assets << mod1

type16.model_assets << mod1
type16.model_assets << mod44
type16.model_assets << mod45
type16.model_assets << mod326
type16.model_assets << mod327

type17.model_assets << mod11
type17.model_assets << mod12
type17.model_assets << mod46
type17.model_assets << mod47
type17.model_assets << mod48
type17.model_assets << mod49
type17.model_assets << mod50
type17.model_assets << mod51
type17.model_assets << mod52
type17.model_assets << mod53
type17.model_assets << mod54
type17.model_assets << mod373


type18.model_assets << mod1
type18.model_assets << mod55
type18.model_assets << mod56
type18.model_assets << mod57
type18.model_assets << mod58
type18.model_assets << mod59
type18.model_assets << mod60
type18.model_assets << mod61
type18.model_assets << mod62

type19.model_assets << mod1
type19.model_assets << mod11
type19.model_assets << mod12
type19.model_assets << mod28
type19.model_assets << mod52
type19.model_assets << mod83
type19.model_assets << mod63
type19.model_assets << mod372
type19.model_assets << mod457

type20.model_assets << mod399

type21.model_assets << mod1
type21.model_assets << mod229
type21.model_assets << mod230
type21.model_assets << mod330
type21.model_assets << mod331

type22.model_assets << mod1

type23.model_assets << mod1
type23.model_assets << mod14
type23.model_assets << mod266

type24.model_assets << mod1

type25.model_assets << mod270
type25.model_assets << mod350
type25.model_assets << mod360
type25.model_assets << mod384
type25.model_assets << mod454

type26.model_assets << mod401

type27.model_assets << mod1

type28.model_assets << mod1

type29.model_assets << mod1
type29.model_assets << mod11
type29.model_assets << mod29
type29.model_assets << mod47
type29.model_assets << mod65
type29.model_assets << mod66
type29.model_assets << mod222
type29.model_assets << mod63
type29.model_assets << mod449
type29.model_assets << mod445
type29.model_assets << mod338
type29.model_assets << mod417

type30.model_assets << mod1

type31.model_assets << mod10
type31.model_assets << mod11
type31.model_assets << mod34
type31.model_assets << mod47
type31.model_assets << mod49
type31.model_assets << mod69
type31.model_assets << mod71
type31.model_assets << mod72
type31.model_assets << mod73
type31.model_assets << mod74
type31.model_assets << mod75
type31.model_assets << mod76
type31.model_assets << mod80
type31.model_assets << mod81
type31.model_assets << mod82
type31.model_assets << mod84
type31.model_assets << mod85
type31.model_assets << mod221
type31.model_assets << mod222
type31.model_assets << mod223
type31.model_assets << mod290
type31.model_assets << mod356
type31.model_assets << mod424
type31.model_assets << mod427
type31.model_assets << mod429
type31.model_assets << mod430
type31.model_assets << mod434
type31.model_assets << mod435
type31.model_assets << mod447
type31.model_assets << mod448
type31.model_assets << mod421

type32.model_assets << mod42
type32.model_assets << mod89
type32.model_assets << mod221
type32.model_assets << mod222
type32.model_assets << mod223
type32.model_assets << mod264

type33.model_assets << mod64
type33.model_assets << mod69
type33.model_assets << mod223

type34.model_assets << mod42
type34.model_assets << mod222
type34.model_assets << mod223

type35.model_assets << mod40
type35.model_assets << mod101
type35.model_assets << mod103
type35.model_assets << mod104
type35.model_assets << mod105
type35.model_assets << mod146
type35.model_assets << mod147
type35.model_assets << mod148
type35.model_assets << mod149
type35.model_assets << mod196
type35.model_assets << mod237
type35.model_assets << mod339
type35.model_assets << mod340
type35.model_assets << mod341
type35.model_assets << mod369
type35.model_assets << mod443

type36.model_assets << mod1

type37.model_assets << mod285

type38.model_assets << mod161
type38.model_assets << mod162
type38.model_assets << mod163
type38.model_assets << mod166
type38.model_assets << mod198
type38.model_assets << mod199
type38.model_assets << mod239
type38.model_assets << mod362
type38.model_assets << mod452

type39.model_assets << mod1

type40.model_assets << mod181
type40.model_assets << mod182
type40.model_assets << mod183
type40.model_assets << mod184
type40.model_assets << mod185
type40.model_assets << mod211
type40.model_assets << mod212
type40.model_assets << mod352
type40.model_assets << mod353
type40.model_assets << mod463

type41.model_assets << mod164
type41.model_assets << mod165
type41.model_assets << mod166
type41.model_assets << mod167
type41.model_assets << mod168
type41.model_assets << mod170
type41.model_assets << mod171
type41.model_assets << mod172
type41.model_assets << mod173
type41.model_assets << mod174
type41.model_assets << mod175
type41.model_assets << mod178
type41.model_assets << mod180
type41.model_assets << mod202
type41.model_assets << mod203
type41.model_assets << mod204
type41.model_assets << mod205
type41.model_assets << mod206
type41.model_assets << mod207
type41.model_assets << mod208
type41.model_assets << mod209
type41.model_assets << mod210
type41.model_assets << mod240
type41.model_assets << mod241
type41.model_assets << mod242
type41.model_assets << mod243
type41.model_assets << mod244
type41.model_assets << mod245
type41.model_assets << mod246
type41.model_assets << mod247
type41.model_assets << mod248
type41.model_assets << mod249
type41.model_assets << mod250
type41.model_assets << mod272
type41.model_assets << mod291
type41.model_assets << mod294
type41.model_assets << mod301
type41.model_assets << mod307
type41.model_assets << mod312
type41.model_assets << mod315
type41.model_assets << mod316
type41.model_assets << mod317
type41.model_assets << mod318
type41.model_assets << mod319
type41.model_assets << mod320
type41.model_assets << mod321
type41.model_assets << mod322
type41.model_assets << mod363
type41.model_assets << mod364
type41.model_assets << mod366
type41.model_assets << mod371
type41.model_assets << mod414
type41.model_assets << mod415
type41.model_assets << mod416
type41.model_assets << mod431
type41.model_assets << mod432
type41.model_assets << mod433
type41.model_assets << mod444
type41.model_assets << mod455
type41.model_assets << mod456

type42.model_assets << mod263
type42.model_assets << mod293
type42.model_assets << mod308
type42.model_assets << mod357
type42.model_assets << mod358
type42.model_assets << mod359

type43.model_assets << mod402

type44.model_assets << mod395

type45.model_assets << mod150
type45.model_assets << mod151
type45.model_assets << mod153
type45.model_assets << mod154
type45.model_assets << mod155
type45.model_assets << mod156
type45.model_assets << mod157
type45.model_assets << mod158
type45.model_assets << mod160
type45.model_assets << mod197
type45.model_assets << mod238
type45.model_assets << mod370

type46.model_assets << mod95
type46.model_assets << mod107
type46.model_assets << mod224
type46.model_assets << mod226
type46.model_assets << mod265
type46.model_assets << mod283
type46.model_assets << mod309
type46.model_assets << mod462

type47.model_assets << mod1

type48.model_assets << mod1
type48.model_assets << mod218
type48.model_assets << mod297
type48.model_assets << mod299

type49.model_assets << mod1

type50.model_assets << mod1

type51.model_assets << mod1
type51.model_assets << mod228
type51.model_assets << mod329

type52.model_assets << mod1
type52.model_assets << mod303
type52.model_assets << mod304
type52.model_assets << mod328

type53.model_assets << mod42
type53.model_assets << mod43
type53.model_assets << mod98
type53.model_assets << mod99
type53.model_assets << mod129
type53.model_assets << mod179
type53.model_assets << mod200
type53.model_assets << mod214
type53.model_assets << mod217
type53.model_assets << mod219
type53.model_assets << mod220
type53.model_assets << mod225
type53.model_assets << mod252
type53.model_assets << mod253
type53.model_assets << mod254
type53.model_assets << mod257
type53.model_assets << mod258
type53.model_assets << mod259
type53.model_assets << mod271
type53.model_assets << mod287
type53.model_assets << mod288
type53.model_assets << mod289
type53.model_assets << mod292
type53.model_assets << mod306
type53.model_assets << mod349
type53.model_assets << mod367

type54.model_assets << mod1

type55.model_assets << mod201
type55.model_assets << mod213

type56.model_assets << mod1

type57.model_assets << mod1

type58.model_assets << mod311

type59.model_assets << mod1
type59.model_assets << mod11
type59.model_assets << mod29
type59.model_assets << mod48
type59.model_assets << mod425
type59.model_assets << mod426

type60.model_assets << mod1

type61.model_assets << mod1

type62.model_assets << mod115
type62.model_assets << mod343
type62.model_assets << mod344
type62.model_assets << mod345


type63.model_assets << mod96
type63.model_assets << mod102
type63.model_assets << mod176
type63.model_assets << mod231
type63.model_assets << mod232
type63.model_assets << mod254
type63.model_assets << mod267
type63.model_assets << mod313
type63.model_assets << mod314
type63.model_assets << mod332
type63.model_assets << mod333
type63.model_assets << mod405

type64.model_assets << mod1

type65.model_assets << mod42
type65.model_assets << mod43
type65.model_assets << mod222
type65.model_assets << mod295

type66.model_assets << mod1
type66.model_assets << mod42
type66.model_assets << mod43
type66.model_assets << mod222
type66.model_assets << mod252

type67.model_assets << mod1
type67.model_assets << mod138
type67.model_assets << mod215
type67.model_assets << mod296
type67.model_assets << mod305
type67.model_assets << mod396

type68.model_assets << mod400

type69.model_assets << mod1

type70.model_assets << mod397

type71.model_assets << mod1

type72.model_assets << mod1

type73.model_assets << mod403

type74.model_assets << mod404

type75.model_assets << mod377
type75.model_assets << mod378
type75.model_assets << mod379

type76.model_assets << mod1
type76.model_assets << mod86
type76.model_assets << mod87
type76.model_assets << mod91

type77.model_assets << mod11
type77.model_assets << mod42
type77.model_assets << mod113
type77.model_assets << mod142
type77.model_assets << mod177
type77.model_assets << mod219
type77.model_assets << mod256
type77.model_assets << mod276
type77.model_assets << mod277
type77.model_assets << mod284

type78.model_assets << mod1
type78.model_assets << mod14

type79.model_assets << mod186
type79.model_assets << mod187
type79.model_assets << mod188
type79.model_assets << mod189
type79.model_assets << mod190
type79.model_assets << mod191
type79.model_assets << mod192
type79.model_assets << mod193
type79.model_assets << mod348

type80.model_assets << mod1

type81.model_assets << mod152
type81.model_assets << mod169
type81.model_assets << mod241
type81.model_assets << mod251
type81.model_assets << mod261
type81.model_assets << mod262
type81.model_assets << mod282
type81.model_assets << mod302
type81.model_assets << mod310
type81.model_assets << mod365
type81.model_assets << mod453

type82.model_assets << mod1

type83.model_assets << mod1

type84.model_assets << mod194
type84.model_assets << mod195
type84.model_assets << mod227
type84.model_assets << mod235
type84.model_assets << mod255
type84.model_assets << mod260
type84.model_assets << mod408
type84.model_assets << mod409

type85.model_assets << mod1

type86.model_assets << mod106
type86.model_assets << mod223
type86.model_assets << mod274

type87.model_assets << mod1

type88.model_assets << mod1
type88.model_assets << mod12
type88.model_assets << mod32
type88.model_assets << mod47
type88.model_assets << mod65
type88.model_assets << mod77
type88.model_assets << mod423

type89.model_assets << mod355

type90.model_assets << mod14
type90.model_assets << mod114
type90.model_assets << mod233
type90.model_assets << mod234
type90.model_assets << mod286
type90.model_assets << mod334
type90.model_assets << mod335
type90.model_assets << mod336
type90.model_assets << mod337
type90.model_assets << mod342
type90.model_assets << mod406
type90.model_assets << mod407

type91.model_assets << mod11
type91.model_assets << mod12
type91.model_assets << mod29
type91.model_assets << mod32
type91.model_assets << mod47
type91.model_assets << mod65
type91.model_assets << mod66
type91.model_assets << mod67
type91.model_assets << mod70
type91.model_assets << mod75
type91.model_assets << mod77
type91.model_assets << mod78
type91.model_assets << mod79
type91.model_assets << mod81
type91.model_assets << mod63
type91.model_assets << mod374
type91.model_assets << mod446
type91.model_assets << mod458
type91.model_assets << mod459

type92.model_assets << mod11
type92.model_assets << mod47

type93.model_assets << mod1

type94.model_assets << mod223

type95.model_assets << mod42

type96.model_assets << mod1

type97.model_assets << mod1

type98.model_assets << mod361

type99.model_assets << mod1
type99.model_assets << mod97
type99.model_assets << mod159
type99.model_assets << mod281
type99.model_assets << mod298
type99.model_assets << mod390
type99.model_assets << mod391

type100.model_assets << mod394

type101.model_assets << mod1

type102.model_assets << mod1

type103.model_assets << mod1
type103.model_assets << mod11
type103.model_assets << mod13
type103.model_assets << mod29
type103.model_assets << mod63
type103.model_assets << mod68
type103.model_assets << mod69
type103.model_assets << mod71
type103.model_assets << mod73
type103.model_assets << mod81
type103.model_assets << mod221
type103.model_assets << mod290
type103.model_assets << mod419
type103.model_assets << mod418

type104.model_assets << mod92
type104.model_assets << mod94
type104.model_assets << mod268
type104.model_assets << mod269
type104.model_assets << mod279
type104.model_assets << mod280
type104.model_assets << mod351

type105.model_assets << mod1
type105.model_assets << mod88
type105.model_assets << mod90
type105.model_assets << mod92
type105.model_assets << mod93
type105.model_assets << mod100
type105.model_assets << mod108
type105.model_assets << mod208
type105.model_assets << mod216
type105.model_assets << mod268
type105.model_assets << mod269
type105.model_assets << mod275
type105.model_assets << mod278
type105.model_assets << mod279
type105.model_assets << mod280
type105.model_assets << mod380
type105.model_assets << mod381
type105.model_assets << mod382
type105.model_assets << mod383
type105.model_assets << mod385

type106.model_assets << mod1
type106.model_assets << mod109
type106.model_assets << mod110
type106.model_assets << mod111
type106.model_assets << mod112
type106.model_assets << mod386
type106.model_assets << mod387
type106.model_assets << mod388
type106.model_assets << mod389
type106.model_assets << mod464

type107.model_assets << mod116
type107.model_assets << mod117
type107.model_assets << mod118
type107.model_assets << mod119
type107.model_assets << mod120
type107.model_assets << mod121
type107.model_assets << mod122
type107.model_assets << mod123
type107.model_assets << mod124
type107.model_assets << mod125
type107.model_assets << mod126
type107.model_assets << mod127
type107.model_assets << mod128
type107.model_assets << mod130
type107.model_assets << mod131
type107.model_assets << mod132
type107.model_assets << mod133
type107.model_assets << mod134
type107.model_assets << mod135
type107.model_assets << mod136
type107.model_assets << mod137
type107.model_assets << mod139
type107.model_assets << mod140
type107.model_assets << mod141
type107.model_assets << mod143
type107.model_assets << mod144
type107.model_assets << mod145
type107.model_assets << mod236
type107.model_assets << mod273
type107.model_assets << mod346
type107.model_assets << mod347
type107.model_assets << mod410
type107.model_assets << mod411
type107.model_assets << mod436
type107.model_assets << mod437
type107.model_assets << mod438
type107.model_assets << mod439
type107.model_assets << mod440
type107.model_assets << mod441
type107.model_assets << mod442
type107.model_assets << mod450

type108.model_assets << mod300
type108.model_assets << mod392
type108.model_assets << mod393

type109.model_assets << mod11

type110.model_assets << mod1

type111.model_assets << mod1

type112.model_assets << mod1

type113.model_assets << mod1
type113.model_assets << mod461




status1 = StatusAsset.create( id: 1, status_asset_name: 'NEW' )
status2 = StatusAsset.create( id: 2, status_asset_name: 'GOOD CONDITION' )
status3 = StatusAsset.create( id: 3, status_asset_name: 'AVERAGE CONDITION' )
status4 = StatusAsset.create( id: 4, status_asset_name: 'LOW CONDITION' )
status5 = StatusAsset.create( id: 5, status_asset_name: 'FOR REPAIR' )
status6 = StatusAsset.create( id: 6, status_asset_name: 'SCRAP' )
status7 = StatusAsset.create( id: 7, status_asset_name: 'ACCIDENT' )

color1 = ColorAsset.create( id: 1, color_asset_name: 'Beige' )
color2 = ColorAsset.create( id: 2, color_asset_name: 'Black' )
color3 = ColorAsset.create( id: 3, color_asset_name: 'Black/Yellow' )
color4 = ColorAsset.create( id: 4, color_asset_name: 'Blue' )
color5 = ColorAsset.create( id: 5, color_asset_name: 'Brown' )
color6 = ColorAsset.create( id: 6, color_asset_name: 'Dark-gray' )
color7 = ColorAsset.create( id: 7, color_asset_name: 'Golden' )
color8 = ColorAsset.create( id: 8, color_asset_name: 'Gray' )
color9 = ColorAsset.create( id: 9, color_asset_name: 'Green' )
color10 = ColorAsset.create( id: 10, color_asset_name: 'Orange' )
color11 = ColorAsset.create( id: 11, color_asset_name: 'Red' )
color12 = ColorAsset.create( id: 12, color_asset_name: 'Silver' )
color13 = ColorAsset.create( id: 13, color_asset_name: 'Steel/Gray' )
color14 = ColorAsset.create( id: 14, color_asset_name: 'White' )
color15 = ColorAsset.create( id: 15, color_asset_name: 'Yellow' )
color16 = ColorAsset.create( id: 16, color_asset_name: 'N/A' )


