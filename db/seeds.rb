# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.create([{description: "approver",value: "amir@localhost.my"}])
Setting.create([{description: "verifier", value: "razi@localhost.my"}])
Setting.create([{description: "travel_price", value: "0.06"}])
Staff.create(name: "Amir Haris Ahmad", password: "123456", admin: true, email: "amir@localhost.my", company: "Dnsvault")
Staff.create(name: "Muhammad Al Razi Mohd Zain", password: "123456", admin: true, email: "razi@localhost.my", company: "Localhost")