class User < ActiveRecord::Base
  has_many :bids
  has_many :events, through: :bids

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
