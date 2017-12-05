class GithubService

  attr_reader :access_token

  def initialize(args)
    @code = args[:code]
    @access_token = args[:access_token] ||= self.class.get_access_token(@code)
  end

  def user_info
            
  end

  def self.get_access_token(code)
    conn = Faraday.new(url: github_address + "oauth/access_token")
    response = conn.post do |f|
      f.params["client_id"] = ENV["GITHUB_CLIENT"]
      f.params["client_secret"] = ENV["GITHUB_SECRET"]
      f.params["code"] = code
      f.headers["Accept"] = "application/json"
    end
    result = JSON.parse(response.body)
    result["access_token"]
  end

  def self.github_address
    "https://github.com/login/"
  end

end
