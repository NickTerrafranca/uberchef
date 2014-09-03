class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true


  def grouped_messages
    messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    associated_users = []
    user_ids = []
    messages.each do |i|
       user_ids << i[:sender_id] << i[:receiver_id]
    end
    user_ids.uniq!
    user_ids.delete(current_user.id)
    user_ids.each do |i|
      associated_users << User.find(i)
    end
    associated_users
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
