class SessionController < ApplicationController

  def create
    github_service = GithubService.new(code: params["code"])
    user = User.find_or_create_from_github(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

end
