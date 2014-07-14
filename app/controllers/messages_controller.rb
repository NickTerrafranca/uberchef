class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @received_messages = Message.where('receiver_id = ?', current_user[:id]).order('created_at DESC')
    @sent_messages = Message.where('sender_id = ?', current_user[:id])
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.create(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = params[:user_id]
    if @message.save
      flash[:notice] = 'Message sent...'
      redirect_to user_messages_path(current_user)
    else
      flash[:notice] = 'There was a problem sending your message...'
      render :new
    end
  end

  def destroy
    # binding.pry
    @message = Message.find(params[:id])
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
