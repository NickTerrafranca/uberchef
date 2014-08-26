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

  # def message_thread(params)
  # @all_messages = Message.where('sender_id = ? OR sender_id = ?' && 'receiver_id = ? OR receiver_id = ?', current_user.id, params[:id]).order('created_at ASC')
  # @all_messages = Message.find_by_sql(
  #   "SELECT *
  #   FROM messages
  #   WHERE
  #   (sender_id = #{current_user.id} OR sender_id = #{params[:id]})
  #   AND
  #   (receiver_id = #{current_user.id} OR receiver_id = #{params[:id]});"
  #   )
  # end

end
