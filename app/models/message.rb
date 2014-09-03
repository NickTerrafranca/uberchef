class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true

  # def conversations
  #   # messages_contributers = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  #   messages_contributers = Message.where(sender_id: [current_user.id, params[:id]], receiver_id: [current_user.id, params[:id]])
  #   message_names = []
  #   messages_contributers.each do |i|
  #     binding.pry
  #     unless message_names.include?(i[:sender_id]) && message_names.include?(i[:receiver_id])
  #       message_names << [i.sender
  #     end
  #   end
  #   message_names
  # end
  def all_messages
    messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    asociated_users = []
    messages.each do |i|
    # if the array i[:sender_id] or i[:receiver_id] dos not have a user with the user_id of i[:sender_id] or i[:receiver_id]
    # find the user with user_id of i[:sender_id] or i[:receiver_id]
    # and put it in asociated_users
    end
  end

#do I need this?
  def received_messages
    Message.where('receiver_id = ?', current_user[:id])
  end
#or this?
  def sent_messages
    Message.where('sender_id = ?', current_user[:id])
  end
end
