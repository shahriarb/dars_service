class LessonState < ActiveRecord::Base
  attr_accessible :course_state_id, :state, :lesson_id
  belongs_to :course_state

  validate :course_state_id, presence: true
end
