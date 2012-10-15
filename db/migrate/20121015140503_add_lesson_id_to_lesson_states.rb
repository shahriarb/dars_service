class AddLessonIdToLessonStates < ActiveRecord::Migration
  def change
    add_column :lesson_states, :lesson_id, :integer
  end
end
