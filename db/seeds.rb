puts "inserting Seoul-Gu-es and coordinates (SEED)"
# 카테고리 모델 db에 name:구 명 , coor_lat: 위도, coor_long: 경도 넣습니다. 
seoul_gu = JSON.parse(File.read("db/seoul_gu.json"))
seoul_gu["DATA"].each do |x|
    Category.create(name: x["SIG_KOR_NM"], coor_lat: x["LAT"], coor_long: x["LNG"] )
end





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
