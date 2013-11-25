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

ActiveRecord::Schema.define(version: 20131125014627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_addresses", force: true do |t|
    t.integer  "donator_id"
    t.boolean  "main_contact"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cause_categories", force: true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.decimal  "monthly_sponsorship"
    t.integer  "employer_identification_number"
    t.text     "mission_description"
    t.integer  "cause_category_id"
    t.integer  "executive_id"
    t.integer  "phone_number_id"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cause_image"
  end

  create_table "donations", force: true do |t|
    t.integer  "donator_id"
    t.decimal  "donation_amount"
    t.datetime "donation_date"
    t.integer  "payment_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cause_id"
    t.string   "donation_recurrence"
  end

  create_table "donators", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "executives", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_methods", force: true do |t|
    t.integer  "donator_id"
    t.date     "expiration_date"
    t.integer  "billing_address_id"
    t.integer  "phone_number_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_on_card"
    t.string   "credit_card_number"
    t.integer  "security_code"
    t.string   "email"
  end

  create_table "phone_numbers", force: true do |t|
    t.integer  "donator_id"
    t.boolean  "main_contact"
    t.integer  "country_code"
    t.integer  "area_code"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
