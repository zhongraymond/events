class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :guests
  has_many :users_joined, through: :guests, source: :user
  validates :name, :date, :location, :location_state, presence: true, on: :create
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
  errors.add(:date, "can't be in the past") if
    !date.blank? and date < Date.today
end

end
