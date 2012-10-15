class User < ActiveRecord::Base
  attr_accessible :confirmation_code, :confirmed, :email, :token
  has_many :course_states, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
