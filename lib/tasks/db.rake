namespace :db do
  desc "Import companies into the database from a parsed text file"
  # The text file must be formatted with exactly one company per exactly ten lines with exactly one attribute per line in the order of: name, street_address, city_state_zip, phone, website, headquarters, products_services, person_in_charge
  task :seed_test_fixture, [:path] => :environment do |t, args|
    prior_industry_count = Industry.count
    prior_company_count = Company.count

    puts "Reading from file: #{args[:path]}"
    puts "Importing companies into database..."
    SeedFixtureData.run(args[:path])

    final_industry_count = Industry.count
    final_company_count = Company.count
    puts "Processing is now complete"
    puts "New categories: #{final_industry_count - prior_industry_count}"
    puts "New companies: #{final_company_count - prior_company_count}"
  end

  task :seed_all_data_files => :environment do
    Dir.foreach('data/formatted_for_rake') do |file|
      next if file == '.' || file =='..'
      puts "Importing from file: #{file}"
      puts "Before company count: #{Company.count}"
      SeedFixtureData.run("data/formatted_for_rake/#{file}")
      puts "Finished with file: #{file}"
      puts "After #{file} company count: #{Company.count}"
    end
  end
end
