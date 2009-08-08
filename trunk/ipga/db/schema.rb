# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090808161517) do

  create_table "departments", :force => true do |t|
    t.string "name"
  end

  create_table "favorites", :force => true do |t|
    t.integer "user_id"
  end

  create_table "favorites_resources", :force => true do |t|
    t.integer "favorite_id"
    t.integer "resource_id"
  end

  create_table "friendly_names", :force => true do |t|
    t.string "name"
  end

  create_table "industries", :force => true do |t|
    t.string "name"
  end

  create_table "levels", :force => true do |t|
    t.string "name"
  end

  create_table "locations", :force => true do |t|
    t.string "en_name"
    t.string "zh_name"
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "request_id"
    t.integer  "sender_id"
    t.boolean  "readed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "receiver_id"
  end

  create_table "official_grades", :force => true do |t|
    t.string "name"
  end

  create_table "requests", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_friendly_name"
    t.string   "receiver_friendly_name"
  end

  create_table "resources", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.integer  "location_id"
    t.integer  "industry_id"
    t.integer  "level_id"
    t.integer  "official_grade_id"
    t.integer  "strength_id"
    t.integer  "owner_id"
  end

  create_table "strengths", :force => true do |t|
    t.integer "rank"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "locale"
  end

end
