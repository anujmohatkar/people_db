# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do |person|

  Person.create!(
      name: Faker::Name.name,
      ph_no: Faker::PhoneNumber.cell_phone_in_e164,
      user_id: User.last.id
    )
  Address.create!(
      title: "Home",
      address: Faker::Address.full_address,
      person_id: Person.last.id
    )
  Address.create!(
      title: "Work",
      address: Faker::Address.full_address,
      person_id: Person.last.id
    )
end

puts "50 person created, 100 Addresses created."