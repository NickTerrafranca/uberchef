class User < ActiveRecord::Base
  has_many :bids
  has_many :messages
  has_many :events_bid_on, through: :bids, source: :event
  has_many :events_hosted, class_name: 'Event'

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :city, presence: true
  # validates :state, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
