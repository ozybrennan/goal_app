require 'rails_helper'

feature "cheers" do
  before :each do
    visit new_user_url
    fill_in "Username", with: "bob"
    fill_in "Password", with: "bobbob"
    click_button "Sign Up"

    visit goals_url
    click_button "Create Goals"
    fill_in "Goal", with: "my goal!!!"
    choose "public"
    click_button "Submit Goal"

    visit new_user_url
    fill_in "Username", with: "cat"
    fill_in "Password", with: "catcat"
    click_button "Sign Up"

    visit goal_url(Goal.find_by_body("my goal!!!"))
  end

  scenario "cheer" do
    click_button "cheer"
    expect(page).to have_content("Cheered by cat")
    expect(User.find_by_username("cat").cheers).to eq(9)
  end

  scenario "uncheer" do
    click_button "cheer"
    click_button "uncheer"
    expect(page).not_to have_content("Cheered by cat")
    expect(User.find_by_username("cat").cheers).to eq(10)
  end

  scenario "out of cheers" do
    User.find_by_username("cat").cheers = 0
    expect(page).not_to have_content("cheer")
  end


  end
