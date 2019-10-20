class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :mynumber, null:false
      t.string :name, null: false
      t.text :research

      t.timestamps
      t.index :mynumber, unique:true
    end
  end
end
