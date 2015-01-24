require 'rails_helper'

feature "the signup process" do
  feature "signing up users" do
    before :each do
      visit new_user_url
    end

    it "has a new user page" do
      expect(page).to have_content('Sign Up')
    end

    it "shows username on the homepage after signup" do
      fill_in 'username', :with => 'testing_username'
      fill_in 'password', :with => 'testing_password'
      click_button 'Sign Up'

      expect(page).to have_content('username')
    end
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
        visit "users/new"
        fill_in 'username', :with => 'testing_username'
        fill_in 'password', :with => 'testing_password'
        click_button 'Sign Up'

        expect(page).to have_content('username')
    end

  end

  feature "logging in" do
      it "shows username on the homepage after login" do
        visit new_user_url
        fill_in 'username', :with => 'testing_username'
        fill_in 'password', :with => 'testing_password'
        click_button 'Sign Up'
        click_button 'Sign Out'
        visit(new_session_url)
        expect(page).to have_content('Sign In')
        fill_in 'username', :with => 'testing_username'
        fill_in 'password', :with => 'testing_password'
        click_button 'Sign In'

        expect(page).to have_content('username')
      end

  end

  feature "logging out" do
    it "begins with logged out state" do
      visit(new_session_url)
      expect(page).not_to have_content('username')
    end

    it "doesn't show username on the homepage after logout" do
      visit new_user_url
      fill_in 'username', :with => 'testing_username'
      fill_in 'password', :with => 'testing_password'
      click_button 'Sign Up'
      click_button 'Sign Out'

      expect(page).not_to have_content('username')
    end

  end

end
