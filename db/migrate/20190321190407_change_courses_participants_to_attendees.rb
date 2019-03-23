class ChangeCoursesParticipantsToAttendees < ActiveRecord::Migration[5.2]
  def change
    rename_table :participants, :users
    rename_table :courses_participants, :participants
    rename_column :participants, :participant_id, :user_id
  end
end
