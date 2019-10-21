class CreateRegisteredTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_teachers do |t|
      t.integer :teacher_id, null: false
      t.integer :rank, default: 0

      t.timestamps
      t.index :teacher_id, unique: true
    end
  end
end
