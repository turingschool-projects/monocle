FactoryGirl.define do
  factory :company do
    industries        {[FactoryGirl.create(:industry)]}
    name              { Faker::Company.name }
    website           { Faker::Internet.url }
    headquarters      { Faker::Address.city + ", " +
                        Faker::Address.state_abbr }
    products_services { Faker::Hipster.paragraph }
  end

  factory :note do
    title             { Faker::Lorem.word }
    body              { Faker::Lorem.sentence }
    user_id           { Faker::Number.number(10) }
    company_id        { Faker::Number.number(10) }
  end

  factory :industry do
    name { Faker::Commerce.department(2, true) }

    factory :industry_with_companies do
      transient do
        companies_count 2
      end

      after(:create) do |industry, evaluator|
        create_list(:company, evaluator.companies_count, industry: industry)
      end
    end
  end

  factory :city do
    name  {Faker::Address.city}
  end

  factory :state do
    name  {Faker::Address.state}
  end

  factory :zip_code do
    zip_code  {Faker::Address.zip}
  end

  factory :location do
    street_address  {Faker::Address.street_name}
    phone           {Faker::PhoneNumber.phone_number}
    primary_contact {Faker::Name.name}
    city            {FactoryGirl.create(:city)}
    state           {FactoryGirl.create(:state)}
    zip_code        {FactoryGirl.create(:zip_code)}
    company         {FactoryGirl.create(:company)}
  end
end
