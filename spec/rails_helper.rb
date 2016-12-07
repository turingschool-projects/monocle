ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

def admin_logs_in
  admin = User.create({username: 'tester', slack_uid: 'tester', slack_access_token: 1, role: 2})
  allow_any_instance_of(ApplicationController)
          .to receive(:current_user)
          .and_return(admin)
end

def moderator_logs_in
  moderator = User.create({username: 'tester', slack_uid: 'tester', slack_access_token: 1, role: 1})
  allow_any_instance_of(ApplicationController)
          .to receive(:current_user)
          .and_return(moderator)
end

def user_logs_in
  user = User.create({username: 'tester', slack_uid: 'tester', slack_access_token: 1})
  allow_any_instance_of(ApplicationController)
          .to receive(:current_user)
          .and_return(user)
end

def create_unapproved_company(name = 'TestCo')
  industry = Industry.create(name: "Applesauce")
  company = Company.create({
      name: name,
      website: "www.monocle.com",
      headquarters: "Denver, CO",
      products_services: "Jobs"
    })
  company.industries << industry
  company.locations << Location.create({
    street_address: '123 Test St',
    phone: "123-456-789",
    primary_contact: "Dan Broadbent",
    city: "Denver",
    state: "Colorado",
    zip_code: "80202"
  })
end

def create_approved_company(name = 'TestCo')
  create_unapproved_company(name)
  comp_loc = Company.last.locations.last
  comp_loc.status = 1
  comp_loc.save
  Company.last
end

def add_approved_location_to_company(company)
  state = State.create(name: Faker::Address.state)
  city = City.create(name: Faker::Address.city)
  zip_code = ZipCode.create(zip_code: Faker::Address.zip)
  company.locations << Location.create(
    street_address: '123 Another Test St',
    phone: "987-654-3210",
    primary_contact: "Nate Anderson",
    city_id: city.id,
    state_id: state.id,
    zip_code_id: zip_code.id,
    status: 1
  )
end
