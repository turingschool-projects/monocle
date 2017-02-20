class CensusUser

  def self.create_census_users(url, access_token)
    census_results = CensusService.new.get_users(url, access_token)
    census_results.each do |census_user|
      CensusUser.new(
        census_user[:id]
        census_user[:first_name],
        census_user[:last_name],
        census_user[:slack],
        census_user[:email]
      )
    end
  end

end
