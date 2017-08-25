puts "inserting Seoul-Gu-es and coordinates (SEED)"
# 카테고리 모델 db에 name:구 명 , coorlat: 위도, coorlong: 경도 넣습니다. 
seoul_gu = JSON.parse(File.read("db/seoul_gu.json"))
seoul_gu["DATA"].each do |x|
    Category.create(name: x["SIG_KOR_NM"], coorlat: x["LAT"], coorlong: x["LNG"] )
end

puts "inserting sports types (SEED)"
[
    ["헬스"],
    ["요가, 필라테스"],
    ["수영"],
    ["체육관"],
    ["기타"]
].each do |x|
    Type.create(name: x[0])
end
 

puts "inserting seed posts"
10.times { |i|
    random_str1 = ('a'..'z').to_a.shuffle[0,8].join
    random_str2 = ('a'..'z').to_a.shuffle[0,49].join
    random_lat = rand(37584700..37584999).to_f/1000000
    random_lng = rand(126997000..126997299).to_f/1000000
    Post.create(user_id: 1, category_id: rand(1..25), type_id: rand(1..5), title: "seed_title#{random_str1}", name: random_str1, price: rand(2..9)*1000, date: "2017-03-03", money: rand(2..9)*100, reason: random_str2, content: "content#{random_str2}", lat: random_lat, lng: random_lng)
}

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)