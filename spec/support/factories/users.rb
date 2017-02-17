FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
  end
end
