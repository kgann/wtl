# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120515153807) do

  create_table "artists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "username",                       :null => false
    t.string   "email",                          :null => false
    t.string   "password",         :limit => 40, :null => false
    t.string   "salt",             :limit => 3,  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "profile_image_id"
  end

  create_table "artists_images", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "image_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "filename"
    t.boolean  "photo_loop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "artist_id"
    t.integer  "item_id"
    t.integer  "post_id"
    t.string   "title"
  end

  create_table "items", :force => true do |t|
    t.integer  "category_id"
    t.integer  "price"
    t.integer  "artist_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shop_info", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone_number"
    t.string   "hours"
    t.string   "zip"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
