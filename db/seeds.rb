puts "Inserting category data"
[
    ["종로, 중구, 용산"],
    ["도봉, 강북, 성북, 노원"],
    ["동대문, 중랑, 성동, 강진"],
    ["강동, 송파"],
    ["서초, 강남"],
    ["동작, 관악, 금천"],
    ["강서, 양천, 영등포, 구로"],
    ["은평, 마포, 서대문"]
].each do |x|
    Category.create(name:x[0])
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
