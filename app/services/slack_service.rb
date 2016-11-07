module SlackService
  def self.authenticate(params)
    return false if params["error"] || params["code"].nil?
  end
end
