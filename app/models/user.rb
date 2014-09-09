class User < ActiveRecord::Base
  has_many :bids
  has_many :messages
  has_many :events_bid_on, through: :bids, source: :event
  has_many :events_hosted, class_name: 'Event'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :state, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def grouped_messages
    user_ids = Message.where("sender_id = ? OR receiver_id = ?", id, id).pluck(:sender_id, :receiver_id).flatten
    other_user_ids = (Set.new(user_ids) - [id]).to_a
    User.where(id: other_user_ids)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def address_helper
    "#{address}, #{city}, #{state} #{zip}"
  end

  def location
    "#{city}, #{state}"
  end

  def sent_messages
    Message.where(sender: self)
  end

  def received_messages
    Message.where(receiver: self)
  end

end
