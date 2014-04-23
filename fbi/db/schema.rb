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

ActiveRecord::Schema.define(:version => 20140319132335) do

  create_table "archives", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "correlations", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.integer  "digital_datum_id"
    t.string   "data"
  end

  create_table "currents", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.string   "data"
    t.integer  "digital_datum_id"
  end

  create_table "digital_data", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "examinations_id"
    t.integer  "examination_id"
  end

  create_table "examinations", :force => true do |t|
    t.integer  "patient"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "patient_id"
    t.string   "number"
    t.string   "comment"
  end

  create_table "globals", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.integer  "digital_datum_id"
    t.string   "data"
  end

  create_table "graphic_data", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "graphics", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "filename"
    t.integer  "examination_id"
  end

  create_table "integrals", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.string   "data"
    t.integer  "digital_datum_id"
  end

  create_table "localisations", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.string   "data"
    t.integer  "digital_data_id"
    t.integer  "digital_datum_id"
    t.integer  "patient_id"
  end

  create_table "numerical_data", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patients", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "archive"
    t.integer  "idpatient"
    t.string   "cart_name"
  end

  create_table "sectors", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_name"
    t.string   "data"
    t.integer  "digital_datum_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "role"
    t.string   "data"
  end

end
