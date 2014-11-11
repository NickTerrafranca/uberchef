class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy
  has_many :applicants, through: :bids

  validates :user, presence: true
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

  def self.current_events
    where('start_time >= ?', Date.today)
  end


  def self.search(query)
    where("to_tsvector(title || ' ' || city || ' ' || state || ' ' || description) @@ plainto_tsquery(?)", query)
    # where("to_tsvector(name || ' ' || coalesce(description, '')) @@ plainto_tsquery(?)", query)
    # if query.match(/^(?:(A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|P[AR]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY]))$/)
    #   where("state ilike ?", "%#{query}%").order('state')
    # else
    #   where("title ilike ?", "%#{query}%").order('title')
    # end
  end

  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end

  def bid_total
    guest_count * budget
  end

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
    if pickadate_time && pickadate_date
      date = [pickadate_date, pickadate_time].join(' ')
      self.start_time = Time.zone.parse(date)
    end
  end
end
