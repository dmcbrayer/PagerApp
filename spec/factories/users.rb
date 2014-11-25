require 'faker'

FactoryGirl.define do
  factory :user do |f|
  	f.first_name { Faker::Name.first_name }
  	f.last_name { Faker::Name.last_name }
  	f.email { Faker::Internet.email }
  	f.phone "2054227764"
  	f.password "password"
  	f.password_confirmation "password"
    
  end

end
