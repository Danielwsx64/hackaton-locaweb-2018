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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_05_27_015209) do
=======
ActiveRecord::Schema.define(version: 2018_05_27_003648) do
>>>>>>> 86c1d38... Add create resource Schedule
=======
ActiveRecord::Schema.define(version: 2018_05_27_115651) do
>>>>>>> 7a34a19... Add fb_id on client and closed? on schedule
=======
ActiveRecord::Schema.define(version: 2018_05_27_111042) do
>>>>>>> 845be85... Add bot notify

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "additionals", force: :cascade do |t|
    t.integer "service_id"
    t.integer "related_service_id"
=======
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
>>>>>>> 86c1d38... Add create resource Schedule
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fb_id"
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

>>>>>>> 845be85... Add bot notify
  create_table "schedule_tasks", force: :cascade do |t|
    t.bigint "schedule_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_tasks_on_schedule_id"
    t.index ["service_id"], name: "index_schedule_tasks_on_service_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "date_start"
    t.datetime "date_end"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "closed", default: false
    t.index ["client_id"], name: "index_schedules_on_client_id"
  end

>>>>>>> 86c1d38... Add create resource Schedule
  create_table "services", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "duration"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "work_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "schedules", "clients"
end
