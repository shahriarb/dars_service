class AddLessonIdToQuizStates < ActiveRecord::Migration
  def change
    add_column :quiz_states, :lesson_id, :integer
  end
end
