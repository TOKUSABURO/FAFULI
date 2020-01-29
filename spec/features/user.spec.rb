require 'rails_helper'
RSpec.feature "User testing", type: :feature do
  scenario "test user signup" do
    visit home_index_path
    click_link 'Get started'
    fill_in 'name', with: 'noro'
    fill_in 'email', with: 'noro@gmail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "noro"
  end
end
