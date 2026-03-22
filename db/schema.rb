# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_21_133529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "card_dependencies", force: :cascade do |t|
    t.bigint "blocked_card_id", null: false
    t.bigint "blocking_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_card_id"], name: "index_card_dependencies_on_blocked_card_id"
    t.index ["blocking_card_id"], name: "index_card_dependencies_on_blocking_card_id"
  end

  create_table "card_tags", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.bigint "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_tags_on_card_id"
    t.index ["tag_id"], name: "index_card_tags_on_tag_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_type"
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "priority"
    t.bigint "project_id", null: false
    t.bigint "sprint_id"
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_cards_on_project_id"
    t.index ["sprint_id"], name: "index_cards_on_sprint_id"
  end

  create_table "folders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_folders_on_project_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "project_id", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["project_id"], name: "index_memberships_on_project_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "note_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "source_note_id", null: false
    t.bigint "target_note_id", null: false
    t.datetime "updated_at", null: false
    t.index ["source_note_id"], name: "index_note_links_on_source_note_id"
    t.index ["target_note_id"], name: "index_note_links_on_target_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.json "content"
    t.datetime "created_at", null: false
    t.bigint "folder_id", null: false
    t.bigint "project_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_notes_on_folder_id"
    t.index ["project_id"], name: "index_notes_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.date "end_date"
    t.string "name"
    t.bigint "project_id", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_sprints_on_project_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tags_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "card_dependencies", "cards", column: "blocked_card_id"
  add_foreign_key "card_dependencies", "cards", column: "blocking_card_id"
  add_foreign_key "card_tags", "cards"
  add_foreign_key "card_tags", "tags"
  add_foreign_key "cards", "projects"
  add_foreign_key "cards", "sprints"
  add_foreign_key "folders", "projects"
  add_foreign_key "memberships", "projects"
  add_foreign_key "memberships", "users"
  add_foreign_key "note_links", "notes", column: "source_note_id"
  add_foreign_key "note_links", "notes", column: "target_note_id"
  add_foreign_key "notes", "folders"
  add_foreign_key "notes", "projects"
  add_foreign_key "sessions", "users"
  add_foreign_key "sprints", "projects"
  add_foreign_key "tags", "projects"
end
