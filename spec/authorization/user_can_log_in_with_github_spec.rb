require 'rails_helper'

RSpec.feature "user can log in with github" do
  it "from main page" do
    visit "/"

    expect(page).to_not have_content("#{ENV["GITHUB_USER"]}")
    expect(page).to_not have_content("git-kitty")

    click_on "Log in with Github"
    fill_in "username", with: ENV["GITHUB_USER"]
    fill_in "password", with: ENV["GITHUB_PASS"]
    click_on "Sign In"

    expect(page).to have_content("Welcome #{ENV["GITHUB_USER"]}")
    expect(page).to have_content("git-kitty")
  end
end
