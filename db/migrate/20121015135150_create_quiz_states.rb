class CreateQuizStates < ActiveRecord::Migration
  def change
    create_table :quiz_states do |t|
      t.integer :state
      t.integer :course_state_id

      t.timestamps
    end
  end
end
