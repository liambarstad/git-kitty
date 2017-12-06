class MainController < ApplicationController

  def index
    if !current_user
      render 'login'
    else
      @github = GithubUser.new(current_user)      
    end
  end

end
