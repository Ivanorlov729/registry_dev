# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.find_or_create_by_name(:name=>"Baby")
Event.find_or_create_by_name(:name=>"Bridal")
Event.find_or_create_by_name(:name=>"House Warming")
Event.find_or_create_by_name(:name=>"Lavish Gifts")
puts 'Created event list'