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

ActiveRecord::Schema.define(:version => 20130228120034) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "bill_details", :force => true do |t|
    t.integer  "bill_id"
    t.string   "narration"
    t.decimal  "amount"
    t.decimal  "unit_price"
    t.decimal  "quantity"
    t.integer  "item_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference1"
  end

  create_table "bills", :force => true do |t|
    t.date     "bill_date"
    t.decimal  "total_amount"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extid"
  end

  create_table "chats", :force => true do |t|
    t.text     "chat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "to_id"
  end

  create_table "item_details", :force => true do |t|
    t.integer  "item_id"
    t.decimal  "cost_price"
    t.decimal  "mrp"
    t.string   "batch_number"
    t.string   "status"
    t.string   "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "item_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "published_date"
    t.string   "author_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.string   "related_image"
    t.string   "avatar"
    t.string   "image"
    t.string   "video"
    t.string   "video1_file_name"
    t.string   "video1_content_type"
    t.integer  "video1_file_size"
    t.datetime "video1_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_details", :force => true do |t|
    t.integer  "item_detail_id"
    t.decimal  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "visited_at"
    t.string   "avathar"
  end

end
