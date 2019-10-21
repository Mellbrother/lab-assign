# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_18_021209) do

  create_table "registered_students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank", default: 0
    t.index ["student_id"], name: "index_registered_students_on_student_id", unique: true
  end

  create_table "registered_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "rank", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_registered_teachers_on_teacher_id", unique: true
  end

  create_table "students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mynumber", null: false
    t.string "name", null: false
    t.float "gpa", default: 0.0
    t.integer "gp", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mynumber"], name: "index_students_on_mynumber", unique: true
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mynumber", null: false
    t.string "name", null: false
    t.text "research"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mynumber"], name: "index_teachers_on_mynumber", unique: true
  end

end
