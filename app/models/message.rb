class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true

  # def sent_messages
  #   Message.where(sender: self)
  # end

  # def received_messages
  #   Message.where(receiver: self)
  # end
end
