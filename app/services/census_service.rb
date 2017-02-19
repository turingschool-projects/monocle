class CensusService

  def get_users(url, access_token)
    response = conn.get url, { access_token: access_token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://census-app-staging.herokuapp.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

  end

end
