require 'spec_helper'
require 'rails_helper'


feature 'the signup process' do
    before(:each) do 
        visit new_user_url
    end

  scenario 'has a new user page' do
    expect(page).to have_content "New User"
  end
end 

feature 'signing up a user' do
    before(:each) do 
        visit new_user_url
        fill_in 'Username', with: 'lmcfarlin'
        fill_in 'Password', with: 'password'
        click_button 'Sign Up'
    end 

    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content "Successully created your account! Currently logged in as lmcfarlin..." 
    end
end

# feature "the signup process" do
#   scenario "has a new user page" do
#     visit new_user_url
#     expect(page).to have_content "Sign Up!"
#   end

#   scenario "shows username on the homepage after signup" do
#     sign_up_as('hello_world')
#     expect(page).to have_content "Welcome hello_world"
#   end
# end

# feature "logging in" do
#   given(:hello_world) { FactoryBot.create(:user_hw) }

#   scenario "shows username on the homepage after login" do
#     login_as(hello_world)
#     expect(page).to have_content "Welcome hello_world"
#   end
# end


#   def login_as(user)
#     visit new_session_url
#     fill_in "Username", with: user.username
#     fill_in "Password", with: "password"
#     click_button "Log In"
#   end




feature 'logging in' do
       
  scenario 'shows username on the homepage after login' do
        visit new_session_url
        fill_in 'Username', :with => 'lmcfarlin'
        fill_in 'Password', :with => 'password'
        click_button 'Sign In'
    expect(page).to have_content "lmcfarlin"
  end
end


feature 'logging out' do
    before(:each) do 
        visit new_session_url
        fill_in 'Username', :with => 'lmcfarlin'
        fill_in 'Password', :with => 'password'
        click_button 'Sign In'
    end 
    
  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).to_not have_content "lmcfarlin"
  end
end