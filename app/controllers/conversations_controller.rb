class ConversationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
# If you are using Devise, use the following instead of if logged_in?
# before_action :authenticate_user!
  def index
    @conversations = Conversation.all
  end
  def create
    # If you created your own login function, you should have implemented this by yourself
     # Use the logged_in? method to save conversations only at login.
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
  end
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
