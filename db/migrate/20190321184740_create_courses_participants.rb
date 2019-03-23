class CreateCoursesParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_participants do |t|
      t.integer :course_id, null: false
      t.integer :participant_id, null: false
      
      t.timestamps
    end
  end
end
