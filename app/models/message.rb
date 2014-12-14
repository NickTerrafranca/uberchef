class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true

  def self.message_thread(user, params)
    where(sender_id: [user.id, params], receiver_id: [user.id, params]).order('created_at ASC')
  end


end
