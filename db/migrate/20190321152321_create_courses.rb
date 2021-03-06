class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false # Null, lai nevarētu saglabāt datubāzē bez nosaukuma
      t.string :description
      t.datetime :begins_at
      t.datetime :ends_at
      t.integer :min_participants, default: 0
      t.integer :max_participants, default: 0

      t.timestamps
    end
  end
end
