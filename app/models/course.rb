class Course < ActiveRecord::Base
  attr_accessible :badge, :description, :name
  has_many :course_states, dependent: :destroy 

end
