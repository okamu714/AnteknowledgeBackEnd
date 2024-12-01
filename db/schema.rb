ActiveRecord::Schema[7.0].define(version: 2024_11_25_051453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchase_histories", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "product_id"], name: "index_purchase_histories_on_user_id_and_product_id", unique: true
  end

  create_table "user_infos", force: :cascade do |t|
    t.string "email", null: false
    t.string "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_infos_on_email", unique: true
    t.index ["user_id"], name: "index_user_infos_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
