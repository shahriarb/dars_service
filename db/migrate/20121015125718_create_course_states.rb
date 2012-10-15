class CreateCourseStates < ActiveRecord::Migration
  def change
    create_table :course_states do |t|
      t.integer :state
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
