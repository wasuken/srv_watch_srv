# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_14_060508) do

  create_table "logs", force: :cascade do |t|
    t.datetime "date_point"
    t.text "name"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "server_logs", force: :cascade do |t|
    t.integer "server_id", null: false
    t.integer "log_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["log_id"], name: "index_server_logs_on_log_id"
    t.index ["server_id"], name: "index_server_logs_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.text "name"
    t.text "ip_address"
    t.text "mac_address"
    t.text "other_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "server_logs", "logs"
  add_foreign_key "server_logs", "servers"
end
