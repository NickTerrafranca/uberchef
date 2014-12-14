class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @associated_users = current_user.users_associated_by_message
  end

  def show
    @user = User.find(params[:id])
    @message = Message.new
    @all_messages = Message.message_thread(current_user, params[:id])
  end

  def create
    @message = Message.create(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = params[:user_id]
    if @message.save
      flash[:notice] = 'Message sent...'
      redirect_to message_path(params[:user_id])
    else
      flash[:notice] = 'There was a problem sending your message...'
      redirect_to message_path(params[:user_id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
