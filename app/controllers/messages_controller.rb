class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
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
      redirect_to user_path(params[:user_id])
    else
      flash[:notice] = 'There was a problem sending your message...'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
