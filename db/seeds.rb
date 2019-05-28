# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, password: "123", image:'https://picsum.photos/id/237/200/300')
end

User.create(username: "yev", password: "123")

Chatroom.create(name: 'TEST')

5.times do
  Message.create(content: Faker::Lorem.sentence, user_id: rand(User.first.id..User.last.id), chatroom_id: 1, likes: 0)
end
