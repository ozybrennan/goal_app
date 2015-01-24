require 'rails_helper'

feature "the goals process" do
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

  end

  scenario "public goals" do
    expect(page).to have_content("my goal!!!")
  end

  scenario "updating goals" do

    click_button "Edit Goal"
    fill_in "Goal", with: "not my goal"
    click_button "Update Goal"

    expect(page).to have_content("not my goal")
  end

  scenario "viewing private goals" do
    click_button "Edit Goal"
    choose('private')
    click_button "Update Goal"

    expect(page).to have_content("my goal!!!")

    click_button "Sign Out"

    visit goals_url
    expect(page).to_not have_content("my goal!!!")

    visit goal_url(Goal.find_by_body("my goal!!!"))
    expect(page).to_not have_content("my goal!!!")

  end

  scenario "deleting goals" do
    click_button "Delete Goal"
    expect(page).to_not have_content("my goal!!!")
  end

  scenario "completing goals" do
    click_button "Edit Goal"
    check "Completed"
    click_button "Update Goal"
    expect(page).to have_content("Completed")
  end

end
