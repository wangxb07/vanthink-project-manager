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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120718074958) do

  create_table "followers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "work_hours"
  end

  add_index "followers", ["project_id"], :name => "index_followers_on_project_id"
  add_index "followers", ["user_id"], :name => "index_followers_on_user_id"

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created"
    t.datetime "modified"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "project_phases", :force => true do |t|
    t.string   "name"
    t.datetime "deadline"
    t.integer  "project_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "total_work_hours"
  end

  add_index "project_phases", ["project_id"], :name => "index_project_phases_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "deadline"
    t.integer  "total_work_hours"
    t.datetime "created"
    t.datetime "modified"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "total_work_hours"
    t.integer  "month_work_hours"
    t.datetime "created"
    t.datetime "modified"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.integer  "position_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["position_id"], :name => "index_users_on_position_id"

  create_table "work_orders", :force => true do |t|
    t.string   "content"
    t.string   "remark"
    t.integer  "status"
    t.integer  "work_hours"
    t.datetime "created"
    t.integer  "project_phase_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "follower_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "work_orders", ["follower_id"], :name => "index_work_orders_on_follower_id"
  add_index "work_orders", ["project_id"], :name => "index_work_orders_on_project_id"
  add_index "work_orders", ["project_phase_id"], :name => "index_work_orders_on_project_phase_id"
  add_index "work_orders", ["user_id"], :name => "index_work_orders_on_user_id"

end
