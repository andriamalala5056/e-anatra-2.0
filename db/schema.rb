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

ActiveRecord::Schema.define(version: 2018_06_22_121033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "etabs", force: :cascade do |t|
    t.string "nom_etab"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.text "description"
    t.string "category"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_etabs_on_user_id"
  end

  create_table "etabs_filieres", id: false, force: :cascade do |t|
    t.bigint "etab_id", null: false
    t.bigint "filiere_id", null: false
    t.index ["etab_id", "filiere_id"], name: "index_etabs_filieres_on_etab_id_and_filiere_id"
    t.index ["filiere_id", "etab_id"], name: "index_etabs_filieres_on_filiere_id_and_etab_id"
  end

  create_table "filieres", force: :cascade do |t|
    t.string "filiere"
  end

  create_table "filieres_niveaus", id: false, force: :cascade do |t|
    t.bigint "filiere_id", null: false
    t.bigint "niveau_id", null: false
    t.index ["filiere_id", "niveau_id"], name: "index_filieres_niveaus_on_filiere_id_and_niveau_id"
    t.index ["niveau_id", "filiere_id"], name: "index_filieres_niveaus_on_niveau_id_and_filiere_id"
  end

  create_table "niveaus", force: :cascade do |t|
    t.string "niveau"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "sex", default: "", null: false
    t.date "birthday", null: false
    t.string "phone_number", default: "", null: false
    t.string "address", default: "", null: false
    t.string "image"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "etabs", "users"
end
