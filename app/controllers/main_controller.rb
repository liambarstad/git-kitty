class MainController < ApplicationController

  def index
    if !current_user
      render 'login'
    else
      
    end
  end

end
