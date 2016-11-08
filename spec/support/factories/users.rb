FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    slack_uid Faker::Code.asin
    slack_access_token "xxxx-xxxxxxxxxx-xxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  end
end
