
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(name: 'hashimoto', email: 'web@dyo.jp', password: 'password', password_confirmation: 'password', area: 'yokohama' )

30.times do |i|
User.create(name: "user#{i}", email: "example#{i}@example.com", password: 'password', password_confirmation: 'password')
end