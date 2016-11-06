module SeedFixtureData
  def self.run(path)
    lines = load_file(path)
    companies = group_into_companies(lines)
    category = create_category(path)
    load_companies(category, companies)
  end

  private
    def self.load_file(path)
      raw_file = File.new(path)
      raw_lines = raw_file.readlines
      raw_lines.map { |line| line.chomp }
    end

    def self.create_category(path)
      category_name = File.basename(path, ".txt")
      Category.find_or_create_by!(name: category_name)
    end

    def self.group_into_companies(lines)
      companies = []
      lines.each_slice(10) do |ten_lines|
        companies << ten_lines
      end
      companies
    end

    def self.load_companies(category, companies)
      companies.each do |company|
        name              = company[0]
        street_address    = company[1]
        city_state_zip    = company[2]
        phone             = company[3]
        website           = company[4]
        headquarters      = company[5].sub("Company headquarters: ", "")
        products_services = company[6].sub("Products/Services: ", "")
        person_in_charge  = company[7].sub("Person in charge: ", "")
        city              = company[2].split[0...-2].join(" ").gsub(",", "")
        state             = company[2].split[-2]
        zip_code          = company[2].split.last

        category.companies << Company.new({
          name:              name,
          street_address:    street_address,
          city_state_zip:    city_state_zip,
          phone:             phone,
          website:           website,
          headquarters:      headquarters,
          products_services: products_services,
          person_in_charge:  person_in_charge,
          city:              City.find_or_create_by(name: city),
          state:             State.find_or_create_by(name: state),
          zip_code:          ZipCode.find_or_create_by(zip_code: zip_code)
        })
      end
    end
end
