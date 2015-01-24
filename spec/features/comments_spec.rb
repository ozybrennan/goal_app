require 'rails_helper'

feature "the goal page" do
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

      fill_in "Comment", with: "good job!"
      click_button "Submit Comment"
    end

    scenario "view comment" do
      expect(page).to have_content "good job!"
    end

    scenario "edit comment" do
      click_button "Edit Comment"
      fill_in "Comment", with: "great job!"
      click_button "Update Comment"

      expect(page).to have_content "great job!"
    end

    scenario "delete comment" do
      click_button "Delete Comment"

      expect(page).to_not have_content "good job!"
    end
end

feature "the user page" do
  before :each do
    visit new_user_url
    fill_in "Username", with: "bob"
    fill_in "Password", with: "bobbob"
    click_button "Sign Up"

    fill_in "Comment", with: "good job!"
    click_button "Submit Comment"
  end

  scenario "view comment" do
    expect(page).to have_content "good job!"
  end

  scenario "edit comment" do
    click_button "Edit Comment"
    fill_in "Comment", with: "great job!"
    click_button "Update Comment"

    expect(page).to have_content "great job!"
  end

  scenario "delete comment" do
    click_button "Delete Comment"

    expect(page).to_not have_content "good job!"
  end
end
