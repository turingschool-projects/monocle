module SlackService
  def self.authenticate(params)
    return false if params["error"] || params["code"].nil?
    user_info = fetch_info_via_code(params["code"])
    User.create_from_slack
  end

  private
    def self.fetch_info_via_code(code)
      conn = Faraday.new(:url => "https://slack.com") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      response = conn.get do |req|
        req.url "/api/oauth.access"
        req.params["client_id"]     = ENV['slack_client_id']
        req.params["client_secret"] = ENV['slack_client_secret']
        req.params["code"]          = code
      end
      JSON.parse(response.body)
    end
end
