class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :body, presence: true

  def received_messages
    Message.where('receiver_id = ?', current_user[:id])
  end

  def sent_messages
    Message.where('sender_id = ?', current_user[:id])
  end

  def message_thread(params)
    Message.find_by_sql(
      "SELECT * FROM messages WHERE sender_id = current_user OR sender_id = #{params} AND receiver_id = current_user OR receiver_id = #{params};"
      )

    # Message.where('sender_id = ? OR receiver_id = ?', current_user.id, params) and ('receiver_id = ? OR receiver_id = ?', current_user.id, params)

  end

end
