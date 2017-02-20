class CensusUser
  attr_reader :census_id, :first_name, :last_name, :slack, :email

  def initialize(census_id, first_name, last_name, slack, email)
    @census_id = census_id
    @first_name = first_name
    @last_name = last_name
    @slack = slack
    @email = email
  end

  def self.create_census_users(url, access_token, name)
    census_results = CensusService.new.get_users_by_name(url, access_token, name)
    census_results.map do |census_user|
      CensusUser.new(
        census_user[:id],
        census_user[:first_name],
        census_user[:last_name],
        census_user[:slack],
        census_user[:email]
      )
    end
  end

  def self.find_user(census_users, first_name, last_name)
    census_users.find do |user|
      user.first_name.downcase == first_name.downcase &&
      user.last_name.downcase == last_name.downcase
    end
  end

end
