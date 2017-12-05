class User < ApplicationRecord

  def self.find_or_create_from_github(response_hash)
    user = find_or_create_by(github_id: response_hash["uid"])
    user.name = response_hash["info"]["name"]
    user.username = response_hash["info"]["nickname"]
    user.email = response_hash["info"]["email"]
    user.github_token = response_hash["credentials"]["token"]
    user.image_url = response_hash["extra"]["raw_info"]["avatar_url"]
    return user if user.save
  end

end
