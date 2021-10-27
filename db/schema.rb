# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_18_145108) do

  create_table "action_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blood_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cycles", force: :cascade do |t|
    t.string "created_by"
    t.string "last_modified_by"
    t.integer "roll_out"
    t.integer "status"
    t.string "cycle_year"
    t.integer "policy_id"
    t.integer "location_id"
    t.integer "isCurrent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dependents", force: :cascade do |t|
    t.string "dependent_name"
    t.integer "relationship_id"
    t.date "dob"
    t.integer "is_active"
    t.integer "employee_id"
    t.string "last_modified_by"
    t.string "created_by"
    t.integer "cycle_id"
    t.integer "action_type_id"
    t.integer "policy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employee_cycles", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "top_up_id"
    t.integer "marital_status_id"
    t.integer "cycle_id"
    t.integer "policy_id"
    t.string "last_modified_by"
    t.integer "is_opted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "employee_name"
    t.string "phone_number"
    t.integer "role_id"
    t.integer "is_active"
    t.string "last_modified_by"
    t.integer "employee_id"
    t.integer "blood_group_id"
    t.integer "location_id"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gender"
    t.string "job_title"
    t.string "marital_status"
    t.index ["blood_group_id"], name: "index_employees_on_blood_group_id"
    t.index ["location_id"], name: "index_employees_on_location_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string "name"
    t.string "last_modified_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "top_ups", force: :cascade do |t|
    t.integer "coverage"
    t.integer "amount_deductable"
    t.integer "cycle_id"
    t.string "created_by"
    t.string "last_modified_by"
    t.integer "location_id"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employees", "blood_groups"
  add_foreign_key "employees", "locations"
  add_foreign_key "employees", "roles"
end
