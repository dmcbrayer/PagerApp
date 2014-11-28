# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
	7.times {FactoryGirl.create(:user)}

	User.create(email: "dmcbrayer@gmail.com", password: "password", password_confirmation: "password", phone: "2054227764", first_name: "Daniel", last_name: "McBrayer")

	Organization.create([{name: "Shelby Medical Center", variety: "Hospital"}, {name: "Trinity Medical Center", variety: "Hospital"},{name: "Fair Haven", variety: "Nursing Home"},{name: "Lakeshore", variety: "Rehabilitation Center"}])
end

if Rails.env.production?

	User.create(email: "dmcbrayer@gmail.com", password: "password", password_confirmation: "password", phone: "2054227764", first_name: "Daniel", last_name: "McBrayer")

	Organization.create(name: "Shelby Medical Center", variety: "Hospital")
end