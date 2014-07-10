class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_many :applicants, through: :bids

  validates :user_id, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :start_time, presence: true
  validates :guest_count, presence: true, numericality: { only_integer: true }
  validates :budget, presence: true
  validates :description, presence: true
end
