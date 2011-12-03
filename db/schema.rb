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

ActiveRecord::Schema.define(:version => 20111203220923) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "mbid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spotify_uri"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.float    "rating_out_of"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "recordings", :force => true do |t|
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "spotify_uri"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "recording_id"
    t.float    "rating"
    t.float    "normalized_rating"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
    t.string   "title"
    t.text     "content"
  end

end
