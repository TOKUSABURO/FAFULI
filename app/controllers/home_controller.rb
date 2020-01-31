class HomeController < ApplicationController
  def index
    @teachers = User.where(:user_type => 'Teacher')
    @most_liked = Course.all
  end
end
