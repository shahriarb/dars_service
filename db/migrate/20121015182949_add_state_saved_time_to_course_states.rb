class AddStateSavedTimeToCourseStates < ActiveRecord::Migration
  def change
    add_column :course_states, :state_saved_time, :datetime
  end
end
