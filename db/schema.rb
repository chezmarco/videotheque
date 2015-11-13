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

ActiveRecord::Schema.define(version: 20151113090553) do

  create_table "records", force: :cascade do |t|
    t.string  "nom",         default: "", null: false
    t.string  "nomoriginal"
    t.string  "codage"
    t.string  "realisateur"
    t.integer "annee"
    t.string  "nationalite"
    t.string  "genre"
    t.string  "duree"
    t.string  "propietaire"
    t.integer "dateajout"
    t.string  "nbrecd"
    t.string  "idpret"
    t.integer "datepret"
    t.string  "acteur"
    t.string  "resume"
    t.string  "img_small"
    t.string  "img_big"
    t.string  "note"
    t.string  "note2"
    t.string  "note3"
    t.string  "version"
    t.string  "pret"
    t.string  "reserv"
  end

  add_index "records", ["acteur"], name: "index_records_on_acteur"
  add_index "records", ["annee"], name: "index_records_on_annee"
  add_index "records", ["genre"], name: "index_records_on_genre"
  add_index "records", ["id"], name: "index_records_on_id"
  add_index "records", ["img_small"], name: "index_records_on_img_small"
  add_index "records", ["nationalite"], name: "index_records_on_nationalite"
  add_index "records", ["nom"], name: "index_records_on_nom"
  add_index "records", ["nomoriginal"], name: "index_records_on_nomoriginal"
  add_index "records", ["realisateur"], name: "index_records_on_realisateur"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
