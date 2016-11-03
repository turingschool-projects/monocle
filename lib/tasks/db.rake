namespace :db do
  desc "TODO"
  task :seed_test_fixture, [:path] => :environment do |t, args|
    lines = File.new(args[:path]).readlines.map { |line| line.chomp }

    category = File.basename(args[:path], ".txt")
    Category.create!(name: category)

    companies = []

    lines.each_slice(10) do |ten_lines|
      companies << ten_lines
    end

    companies.each do |company|
      Company.create!(
        name: company[0]
        street_address: company[1]
        city_state_zip: company[2]
        phone: company[3]
        website: company[4]
        headquarters: company[5]
        products_services: company[6]
        person_in_charge: company[7]
      )
    end
  end
end
