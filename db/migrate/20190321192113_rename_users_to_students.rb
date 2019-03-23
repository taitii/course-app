class RenameUsersToStudents < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :students
    rename_column :participants, :user_id, :student_id
  end
end
