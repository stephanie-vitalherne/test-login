require 'faker'

3.times do
  User.create(
    first_name: Faker::Name.name,
    email: Faker::Internet.email
  )
end
