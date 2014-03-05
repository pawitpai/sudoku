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

ActiveRecord::Schema.define(:version => 20140228072206) do

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sudoku_columns", :force => true do |t|
    t.integer "value"
    t.integer "sudoku_row_id"
  end

  create_table "sudoku_rows", :force => true do |t|
    t.integer "value"
    t.integer "sudoku_topic_id"
  end

  create_table "sudoku_topics", :force => true do |t|
    t.string "topic"
  end

  create_table "sudokus", :force => true do |t|
    t.integer  "field11"
    t.integer  "field12"
    t.integer  "field13"
    t.integer  "field21"
    t.integer  "field22"
    t.integer  "field23"
    t.integer  "field31"
    t.integer  "field32"
    t.integer  "field33"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
