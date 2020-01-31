require 'rails_helper'
RSpec.feature "course testing", type: :feature do
  background do
    user = User.create(
      name: "Aimable",
      email: "aimable@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
    @user = User.first
    visit new_user_session_path
    fill_in 'user_email', with: 'aimable@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    course = Course.create(
      info_title: "ruby",
      info_details: "programming language for web applications",
      free_info_topics: "introduction",
      free_info_details: "environment installation and basic function",
      price: 400,
      user_id: @user.id
    )
  end
  scenario "course creation is valid with course tittle, details, free topic, free detail and price" do

    course = Course.create(
      info_title: "java",
      info_details: "programming language for web applications",
      free_info_topics: "introduction",
      free_info_details: "environment installation and basic function",
      price: 400,
      user_id: @user.id)
    expect(course).to be_valid
  end
  scenario "It is not valid when one parameter is missing" do
    @user = User.last
    course = Course.create(
      info_title: "ruby",
      info_details: "programming language for web applications",
      free_info_topics: "introduction",
      free_info_details: "environment installation and basic function",

      user_id: @user.id
    )
    expect(course).not_to be_valid
  end

  scenario "It is not valid when user is not signed in" do
    course = Course.create(
      info_title: "ruby",
      info_details: "programming language for web applications",
      free_info_topics: "introduction",
      free_info_details: "environment installation and basic function",
      price: 400
    )
    expect(course).not_to be_valid
  end
  scenario "Test course list on course index page" do
    visit courses_path
    expect(page).to have_content "ruby"
  end

  scenario "Test if user can view course details" do
    visit courses_path
    click_link 'Follow course'
    expect(page).to have_content "Course details"
    expect(page).to have_content "Free topics"
  end
end
