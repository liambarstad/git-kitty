class SessionController < ApplicationController

  def create
    github_service = GithubService.new(code: params["code"])
    binding.pry
    user = User.find_or_create_from_github(github_service.user_info)
    session[:user_id] = user.id
  end

end
