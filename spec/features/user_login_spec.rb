require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do
  before :each do
    User.create!(:first_name => 'John', :last_name => 'Smith', :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
  end

  scenario "They log in" do
    # ACT
    visit root_path
    click_link 'Login'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'
    # DEBUG / VERIFY
    expect(page).to have_content 'Logout'
    save_screenshot
  end
end
