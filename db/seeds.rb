puts "Inserting category data"
[
    ["강남구"],
    ["강동구"],
    ["강북구"],
    ["강서구"],
    ["관악구"],
    ["광진구"],
    ["구로구"],
    ["금천구"],
    ["노원구"],
    ["도봉구"],
    ["동대문구"],
    ["동작구"],
    ["마포구"],
    ["서대문구"],
    ["서초구"],
    ["성동구"],
    ["성북구"],
    ["송파구"],
    ["양천구"],
    ["영등포구"],
    ["용산구"],
    ["은평구"],
    ["종로구"],
    ["중구"],
    ["중랑구"],
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
