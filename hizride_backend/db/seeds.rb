# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#pasilan asema
User.find(4).update(:destination_lat => "60.1987823", :destination_lng => 24.933358399999975)
#itäkeskus
User.find(7).update(:destination_lat => "60.2100092", :destination_lng => 25.081188200000042)
#Kamppi
User.find(12).update(:destination_lat => "60.16745770000001", :destination_lng => 24.931074800000033)
#Otaniemi
User.find(13).update(:destination_lat => "60.1841396", :destination_lng => 24.83008380000001)
