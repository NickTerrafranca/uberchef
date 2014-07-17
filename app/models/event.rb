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
  validates :duration, presence: true
  validates :guest_count, presence: true, numericality: { only_integer: true }
  validates :budget, presence: true
  validates :description, presence: true

  before_validation :set_start_time

  def pickadate_time=(time)
    @pickadate_time = time
  end

  def pickadate_time
    @pickadate_time
  end

  def pickadate_date=(date)
    @pickadate_date = date
  end

  def pickadate_date
    @pickadate_date
  end

  private

  def set_start_time
    date = [pickadate_date, pickadate_time].join(' ')
    self.start_time = Time.zone.parse(date)
  end
end
