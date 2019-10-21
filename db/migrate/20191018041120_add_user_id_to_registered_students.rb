class AddUserIdToRegisteredStudents < ActiveRecord::Migration[5.2]
  def up
  	execute 'DELETE FROM registered_students'
  	add_reference :registered_students, :user, null: false, index: true
  end

  def down
  	remove_reference :registered_students, :user, index: true
  end
end
