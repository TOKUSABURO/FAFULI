class HomeController < ApplicationController
  def index
    @teachers = User.where(:user_type => 'Teacher')
  end
end
