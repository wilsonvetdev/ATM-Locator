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

ActiveRecord::Schema.define(version: 2020_08_17_133808) do

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.string "street_address"
    t.string "city"
    t.string "zipcode"
    t.float "atm_fee"
  end

  create_table "userbanks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_id"
    t.boolean "user_fav"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
  end

end
