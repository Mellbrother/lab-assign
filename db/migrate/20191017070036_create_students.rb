class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :mynumber, null: false
      t.string :name, null: false
      t.float :gpa, default: 0
      t.integer :gp, default: 0.0

      t.timestamps
      t.index :mynumber, unique: true
    end
  end
end
