class AddQuizeIdToQuizStates < ActiveRecord::Migration
  def change
    add_column :quiz_states, :quiz_id, :integer
  end
end
