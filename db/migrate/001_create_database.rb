class CreateDatabase < ActiveRecord::Migration
  def self.up
    create_table "diseases", force: :cascade do |t|
      t.string "name", limit: 255, null: false
    end

    create_table "hospitals", force: :cascade do |t|
      t.string  "name",    limit: 255, null: false
      t.integer "terr_id", limit: 4,   null: false
      t.string  "adress",  limit: 255, null: false
      t.string  "phone",   limit: 255, null: false
    end

    add_index "hospitals", ["terr_id"], name: "terr_id", using: :btree

    create_table "statistics", id: false, force: :cascade do |t|
      t.integer "disease_id",  limit: 4, null: false
      t.integer "hospital_id", limit: 4, null: false
      t.integer "date",        limit: 4, null: false
      t.integer "patients",    limit: 4, null: false
      t.integer "issued",      limit: 4, null: false
    end

    create_table "territories", force: :cascade do |t|
      t.string  "name",      limit: 255, null: false
      t.integer "parent_id", limit: 4,   null: false
    end

    add_index "territories", ["parent_id"], name: "parent_id", using: :btree
  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end