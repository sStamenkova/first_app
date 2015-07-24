# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(username: "sSimona", email: "simona_stamenkova@hotmail.com", password: "password", password_confirmation: "password", admin: true, confirmed_at: Time.zone.now)


10.times do |x|

username = Faker::Internet.user_name
email = "exampleuser#{x+1}@hotmail.com"
password = "password"

User.create!(username: username, email: email, password: password, password_confirmation: password, confirmed_at: Time.zone.now)

end

users = User.order(:created_at).take(10)

10.times do

content = Faker::Lorem.sentence(5)
title = Faker::Commerce.product_name
image = Faker::Avatar.image

users.each do |user|
user.products.create!(title: title, description: content, image: image)
end

end