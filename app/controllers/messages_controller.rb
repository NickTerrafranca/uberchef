class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @associated_users = current_user.grouped_messages(current_user)
  end

  def show
    @user = User.find(params[:id])
    @message = Message.new
    @all_messages = Message.where(sender_id: [current_user.id, params[:id]], receiver_id: [current_user.id, params[:id]]).order('created_at ASC')
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
      render :show
    end
  end

  # This needs to delete the entire thread.
  def destroy
    @message = current_user.received_messages.find(params[:id])
    @message.destroy
    if @message.destroy
      flash[:notice] = 'Your message was not deleted...'
      redirect_to user_messages_path(current_user)
    else
      flash[:notice] = 'Message deleted...'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
