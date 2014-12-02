FactoryGirl.define do
  factory :message do
    content {Faker::Lorem.sentence}
    recipient 5
  end

end
