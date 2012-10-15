class RemoveLessonIdToQuizStates < ActiveRecord::Migration
  def up
    remove_column :quiz_states, :lesson_id
  end

  def down
    add_column :quiz_states, :lesson_id, :integer
  end
end
