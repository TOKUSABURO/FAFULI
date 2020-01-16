class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [ :show]
  def show
    @conversations = Conversation.all
    @sold_courses = Course.where(:user_id => @user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
