class CreateRegisteredStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_students do |t|
      t.integer :student_id

      t.timestamps
    end
  end
end
