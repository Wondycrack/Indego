# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all if Rails.env.development?
Service.destroy_all if Rails.env.development?

names = []
30.times do
  names <<Faker::Hipster.word
end

names = names.uniq

names.each do |name|
  u =  User.create!(
    name: name,
    experience: rand(1..20),
    bio: Faker::TvShows::StarTrek.character,
    speciality: User::SPECIALITIES.sample,
    project_count: rand(1..10),
    email: Faker::Internet.email,
    password: "123456"
  )

  s =  Service.create!(
    description: Faker::Hipster.word,
    rate: rand(200..5000),
    user: u,
    speciality:  Service::SPECIALITIES.sample,
    project_type: Service::PROJECT_TYPE.sample  
  )

  p "Created #{u.name}"
  p "Created #{s.description}"

end

# Service.destroy_all if Rails.env.development?
# 20.times do
#   s =  Service.create!(description: Faker::Hipster.word,
#                             rate: rand(200..5000),
#                             user: User.first,
#                           speciality:  Service::SPECIALITIES.sample,
#                           project_type: Service::PROJECT_TYPE.sample)
#   p "Created #{s.name}"
# end
