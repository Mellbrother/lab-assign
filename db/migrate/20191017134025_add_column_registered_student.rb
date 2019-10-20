class AddColumnRegisteredStudent < ActiveRecord::Migration[5.2]
  def up
  	add_column :registered_students, :rank, :integer, default: 0
  end

  def down
  	remove_column :registered_students, :rank, :integer, default: 0
  end
end
