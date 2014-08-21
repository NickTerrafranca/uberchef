class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true

  def received_messages(current_user)
    Message.where('receiver_id = ?', current_user[:id])
  end

  def sent_messages(current_user)
    Message.where('sender_id = ?', current_user[:id])
  end
end
