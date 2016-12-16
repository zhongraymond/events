class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :guests, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many :commented_event, through: :events, source: :comment
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :location_state, presence: true, on: :create
  validates :password, length: { minimum: 8 }, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
