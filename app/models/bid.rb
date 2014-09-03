class Bid < ActiveRecord::Base
  belongs_to :applicant, class_name: 'User', foreign_key: :user_id
  belongs_to :event

  # bid should have only one user_id to limit a user to one bid per evet per user (uniqueness: true)
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :message, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
