class CourseState < ActiveRecord::Base
  attr_accessible :course_id, :state, :user_id,:state_saved_time
  belongs_to :user
  belongs_to :course
  has_many :lesson_states, dependent: :destroy
  has_many :quiz_states, dependent: :destroy

  validate :user_id, presence: true
  validate :course_id, presence: true
end
