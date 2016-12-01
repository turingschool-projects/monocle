FactoryGirl.define do
  factory :company do
    industries        {[FactoryGirl.create(:industry)]}
    name              { Faker::Company.name }
    website           { Faker::Internet.url }
    headquarters      { Faker::Address.city + ", " +
                        Faker::Address.state_abbr }
    products_services { Faker::Hipster.paragraph }
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
end
