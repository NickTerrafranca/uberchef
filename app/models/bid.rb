class Bid < ActiveRecord::Base
  belongs_to :applicant, class_name: 'User', foreign_key: :user_id
  belongs_to :event

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :message, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

end

