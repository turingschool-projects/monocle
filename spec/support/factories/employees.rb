FactoryGirl.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    slack { Faker::Internet.user_name }
    company
    census_id { Faker::Number.between(1, 100) }
  end
end
