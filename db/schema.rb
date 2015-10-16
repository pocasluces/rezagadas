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

ActiveRecord::Schema.define(version: 20150828192719) do

  create_table "comentarios", force: :cascade do |t|
    t.integer  "entrada_blog_id"
    t.text     "body",            default: "Me gusta."
    t.string   "alias",           default: "Anónimo"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "entrada_blogs", force: :cascade do |t|
    t.string   "titulo"
    t.text     "body"
    t.string   "imagen"
    t.text     "otro1"
    t.text     "otro2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key"

  create_table "tipo_contenidos", force: :cascade do |t|
    t.integer  "entrada_blog_id"
    t.boolean  "astrofoto"
    t.boolean  "metematica"
    t.boolean  "otro1"
    t.boolean  "otro2"
    t.string   "otrotxt"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "Nombre"
    t.string   "email"
    t.string   "codigo"
    t.boolean  "solofotos"
    t.boolean  "solomates"
    t.boolean  "completo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
