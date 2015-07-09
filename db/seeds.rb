# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vendor  = Vendor.create(name: "Jeffe")
vendor1 = Vendor.create(name: "Jeffe1")
vendor2 = Vendor.create(name: "Jeffe2")

5.times do |n|
  Vendor.create(name: "Jeffe#{n+3}")
end

vendor << Suya.create(meat: "beef", spicy: true)
Suya.create(meat: "ram", spicy: true)
Suya.create(meat: "chicken", spicy: true)
Suya.create(meat: "kidney", spicy: false)
Suya.create(meat: "liver", spicy: false)
