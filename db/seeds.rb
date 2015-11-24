# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT ADMIN LOGIN'
user = User.create! :email => 'admin@admin.com', :password => 'administrator', :password_confirmation => 'administrator'
user.toggle!(:admin)
puts 'New user created: ' << user.email