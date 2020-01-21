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

ActiveRecord::Schema.define(version: 20200121190236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "ltree"
  enable_extension "uuid-ossp"

  create_table "clients", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["id"], name: "index_clients_on_id", using: :btree

  create_table "cost_types", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                                                                             null: false
    t.uuid     "parent_id"
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.ltree    "path"
    t.integer  "secondary_id",        default: "nextval('cost_types_secondary_id_seq'::regclass)", null: false
    t.integer  "secondary_parent_id"
  end

  add_index "cost_types", ["id"], name: "index_cost_types_on_id", using: :btree

  create_table "costs", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "amount",       null: false
    t.uuid     "cost_type_id", null: false
    t.uuid     "project_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "costs", ["id"], name: "index_costs_on_id", using: :btree

  create_table "projects", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title",      null: false
    t.uuid     "client_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["id"], name: "index_projects_on_id", using: :btree

end
