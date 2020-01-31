require 'rails_helper'
RSpec.feature "User testing", type: :feature do
  scenario "test user signup" do
    visit home_index_path
    click_link 'Get started'
    fill_in 'user_name', with: 'noro'
    fill_in 'user_email', with: 'noro@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "noro"
  end
end
