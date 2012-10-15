class QuizState < ActiveRecord::Base
  attr_accessible :course_state_id, :state, :quiz_id
  belongs_to :course_state

  validate :course_state_id, presence: true
end
