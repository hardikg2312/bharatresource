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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160314051746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile_no"
    t.string   "email"
    t.integer  "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "name_attr"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "name_attr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_industries", force: :cascade do |t|
    t.string   "name"
    t.integer  "industry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.string   "br_id",                                        null: false
    t.integer  "state_id"
    t.integer  "region_id"
    t.integer  "industry_id"
    t.integer  "sub_industry_id"
    t.date     "dob"
    t.string   "gender"
    t.text     "photo"
    t.text     "address"
    t.string   "email"
    t.boolean  "verified_email",               default: false
    t.string   "mobile_no"
    t.boolean  "verified_mobile_no",           default: false
    t.float    "br_ratings"
    t.string   "proof_docs"
    t.text     "photo_id_proof"
    t.string   "languages_read",                                            array: true
    t.string   "languages_write",                                           array: true
    t.string   "languages_speak",                                           array: true
    t.string   "education"
    t.string   "special_course"
    t.text     "college"
    t.string   "address_proof_docs"
    t.text     "address_proof_photo"
    t.text     "skills"
    t.string   "current_status"
    t.integer  "years_of_experience"
    t.string   "years_of_experience_in_words"
    t.string   "job_title"
    t.text     "job_description"
    t.text     "member_of_any_labor_union",    default: "NO"
    t.text     "key_words"
    t.string   "location_of_job"
    t.string   "ready_to_join"
    t.string   "willing_to_relocate"
    t.string   "willing_to_travel"
    t.string   "specialized_skill"
    t.text     "supervisors_reference"
    t.integer  "previous_salary"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

end
