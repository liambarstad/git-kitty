class GithubUser < SimpleDelegator

  def initialize(user)
    @user = user
  end

end
