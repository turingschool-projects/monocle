module SlackService
  def self.authenticate(params)
    return false if params["error"] || params["code"].nil?
    user_info = fetch_info_via_code(params["code"])
    User.create_from_slack(user_info)
  end

  private
    def self.conn
      Faraday.new(:url => "https://slack.com") do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
        faraday.basic_auth(ENV['slack_client_id'], ENV['slack_client_secret'])
      end
    end

    def self.fetch_info_via_code(code)
      response = conn.get do |req|
        req.url "/api/oauth.access"
        req.params["code"] = code
      end
      JSON.parse(response.body)
    end
end
