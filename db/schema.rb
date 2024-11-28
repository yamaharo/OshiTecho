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

ActiveRecord::Schema[8.0].define(version: 2024_11_28_025129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "Access_Categories", primary_key: "Access_ID", id: { type: :serial, limit: 2 }, comment: "交通手段カテゴリーマスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 50, null: false
    t.index ["Access_ID"], name: "Access_Categories_Access_ID_idx"
  end

  create_table "Access_Costs", primary_key: ["Prefecture_ID_From", "Prefecture_ID_To", "Access_ID"], comment: "県・交通手段中間テーブル（県間コスト）", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Prefecture_ID_From", limit: 2, null: false
    t.integer "Prefecture_ID_To", limit: 2, null: false
    t.integer "Access_ID", limit: 2, null: false
    t.integer "Cost", null: false
    t.index ["Access_ID"], name: "Access_Costs_Access_ID_idx"
    t.index ["Prefecture_ID_From", "Prefecture_ID_To"], name: "Access_Costs_Prefecture_ID_idx"
  end

  create_table "Affiliations", primary_key: ["Oshi_ID", "Office_ID"], comment: "所属テーブル（推し・事務所中間テーブル）", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Office_ID", null: false
    t.integer "Oshi_ID", null: false
    t.date "Affliation_At"
    t.date "Disaffiliation_At"
  end

  create_table "Bringing_Sets", primary_key: "Bringing_Set_ID", id: { type: :serial, limit: 2 }, comment: "持参物セットマスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.text "Name", null: false
    t.text "User_ID", null: false
    t.index ["Bringing_Set_ID"], name: "Bringing_Sets_Bringing_Sets_ID_idx"
    t.unique_constraint ["Name"], name: "Bringing_Sets_Name_key"
  end

  create_table "Bringings", primary_key: "Bringing_ID", id: { type: :serial, limit: 2 }, comment: "持参物マスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 100, null: false
    t.string "User_Type", limit: 2, default: "0", null: false
    t.text "User_ID"
    t.index ["Bringing_ID"], name: "Bringings_Bringing_ID_idx"
  end

  create_table "Bringings_Bringing_Sets", primary_key: ["Bringing_ID", "Bringing_Set_ID"], comment: "持参物・持参物セット中間テーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Bringing_ID", limit: 2, null: false
    t.integer "Bringing_Set_ID", limit: 2, null: false
    t.index ["Bringing_ID", "Bringing_Set_ID"], name: "Bringings_Bringing_Sets_idx"
  end

  create_table "Commnets", primary_key: "Comments_ID", comment: "コメントテーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Memory_ID", null: false
    t.text "User_ID", null: false
    t.text "Comment"
    t.index ["Comments_ID"], name: "Comments_idx1"
  end

  create_table "Event_Casts", primary_key: ["Event_ID", "Oshi_ID"], comment: "イベント・推し中間テーブル（イベントキャスト）", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Event_ID", null: false
    t.integer "Oshi_ID", null: false
    t.index ["Event_ID"], name: "Event_Casts_idx1"
    t.index ["Oshi_ID"], name: "Event_Casts_idx2"
  end

  create_table "Event_Categories", primary_key: "Event_Category_ID", id: { type: :serial, limit: 2 }, comment: "イベントカテゴリーマスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 50, null: false
    t.integer "Sort", limit: 2, default: 1, null: false
    t.index ["Event_Category_ID"], name: "Event_Categories_idx1"
    t.unique_constraint ["Name"], name: "Event_Categories_Name_key"
  end

  create_table "Event_Remarks", primary_key: ["Event_ID", "User_ID"], comment: "イベント備考テーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Event_ID", null: false
    t.text "User_ID", null: false
    t.text "Remark"
    t.integer "Bringing_Set_ID", limit: 2
    t.index ["User_ID", "Event_ID"], name: "Event_Remarks_idx1"
  end

  create_table "Events", primary_key: "Event_ID", id: :serial, comment: "イベントマスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 100, null: false
    t.integer "Event_Category_ID", limit: 2, null: false
    t.string "Creator_Type", limit: 1, null: false
    t.string "Hold_Year_Start", limit: 4
    t.string "Hold_Month_Start", limit: 2, null: false
    t.string "Hold_Day_Start", limit: 2, null: false
    t.string "Hold_Hour_Start", limit: 2
    t.string "Hold_Minute_Start", limit: 2
    t.string "Hold_Year_End", limit: 4
    t.string "Hold_Month_End", limit: 2
    t.string "Hold_Day_End", limit: 2
    t.string "Hold_Hour_End", limit: 2
    t.string "Hold_Minute_End", limit: 2
    t.string "Hold_Place", limit: 100
    t.integer "Hold_Prefecture", limit: 2
    t.integer "Ticket_Price", default: 0
    t.string "Open_Hour", limit: 2, default: "0"
    t.string "Open_Minute", limit: 2, default: "0"
    t.index ["Event_ID"], name: "Events_idx1"
  end

  create_table "Jobs", primary_key: "Job_ID", id: { type: :serial, limit: 2 }, comment: "職業マスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 50, null: false
    t.index ["Job_ID"], name: "Jobs_idx1"
    t.unique_constraint ["Name"], name: "Jobs_Name_key"
  end

  create_table "Likes", primary_key: "Like_ID", comment: "いいねテーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Memory_ID", null: false
    t.text "User_ID", null: false
    t.index ["Memory_ID", "User_ID"], name: "Likes_idx1"
  end

  create_table "Memories", primary_key: "Memory_ID", comment: "思い出テーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Event_ID", null: false
    t.text "User_ID", null: false
    t.text "Report"
    t.text "Present"
    t.text "Letter"
    t.index ["Event_ID", "User_ID"], name: "Memories_idx1"
  end

  create_table "Musics", primary_key: "Music_ID", id: :serial, comment: "音楽テーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 50, null: false
    t.string "Singer", limit: 50
    t.string "Song_Writer", limit: 50
    t.string "Lyricist", limit: 50
    t.string "Arranger", limit: 50
    t.index ["Music_ID"], name: "Musics_idx1"
  end

  create_table "My_Oshis", primary_key: ["User_ID", "Oshi_ID"], comment: "推し・ユーザ中間テーブル（私の推し）", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.text "User_ID", null: false
    t.integer "Oshi_ID", null: false
    t.index ["User_ID"], name: "My_Oshis_idx1"
  end

  create_table "Offices", primary_key: "Office_ID", id: { type: :serial, limit: 2 }, comment: "事務所マスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.text "Name", null: false
    t.integer "Sort", limit: 2, default: 1, null: false
    t.index ["Office_ID"], name: "Affiliations_Affiliation_ID_idx"
    t.unique_constraint ["Name"], name: "Affiliations_Name_key"
  end

  create_table "Oshis", primary_key: "Oshi_ID", id: :serial, comment: "推しマスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 50, null: false
    t.integer "Job_ID", limit: 2
    t.integer "Affiliation_ID", limit: 2
    t.text "Represent"
    t.date "Birthday"
    t.string "Birthplace", limit: 100
    t.text "Hobby"
    t.text "Skill"
    t.string "Debut_Year", limit: 4
    t.text "Debut_Work"
    t.text "Homepage"
    t.text "Fan_Club"
    t.text "Channel"
    t.index ["Oshi_ID"], name: "Oshis_idx1"
  end

  create_table "Prefectures", primary_key: "Prefecture_ID", id: { type: :serial, limit: 2 }, comment: "都道府県マスタ", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 20, null: false
    t.index ["Prefecture_ID"], name: "Prefectures_idx1"
    t.unique_constraint ["Name"], name: "Prefectures_Name_key"
  end

  create_table "Profiels", primary_key: "User_ID", id: :text, comment: "ユーザプロファイルテーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.string "Name", limit: 100, null: false
    t.text "E-Mail"
    t.text "Icon"
    t.integer "Prefecture_ID", limit: 2
    t.integer "Cost_Stay"
    t.integer "Cost_Max"
    t.text "SNS_X"
    t.text "SNS_Note"
    t.text "SNS_Instagram"
    t.index ["User_ID"], name: "Profiels_idx1"
  end

  create_table "Schedules", primary_key: ["Event_ID", "User_ID"], comment: "イベント・ユーザ中間テーブル（スケジュール）", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.integer "Event_ID", null: false
    t.text "User_ID", null: false
    t.index ["User_ID"], name: "Schedules_idx1"
  end

  create_table "Set_Lists", primary_key: ["Set_List_ID", "Music_ID"], comment: "セットリストテーブル", options: "INHERITS (base)", force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
    t.serial "Set_List_ID", null: false
    t.integer "Music_ID", null: false
    t.integer "Sort", limit: 2, null: false
    t.index ["Set_List_ID"], name: "Set_Lists_idx1"
  end

  create_table "base", id: false, force: :cascade do |t|
    t.boolean "Deleted_Flg", default: false, null: false
    t.timestamptz "Created_At"
    t.text "Created_User"
    t.timestamptz "Updated_At"
    t.text "Updated_User"
  end

  add_foreign_key "Access_Costs", "Access_Categories", column: "Access_ID", primary_key: "Access_ID", name: "交通手段", on_delete: :cascade
  add_foreign_key "Access_Costs", "Prefectures", column: "Prefecture_ID_From", primary_key: "Prefecture_ID", name: "県（自）", on_delete: :cascade
  add_foreign_key "Access_Costs", "Prefectures", column: "Prefecture_ID_To", primary_key: "Prefecture_ID", name: "県（至）", on_delete: :cascade
  add_foreign_key "Affiliations", "Offices", column: "Office_ID", primary_key: "Office_ID", name: "事務所", on_delete: :cascade
  add_foreign_key "Affiliations", "Oshis", column: "Oshi_ID", primary_key: "Oshi_ID", name: "推し", on_delete: :cascade
  add_foreign_key "Bringing_Sets", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade, validate: false
  add_foreign_key "Bringings", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade, validate: false
  add_foreign_key "Bringings_Bringing_Sets", "Bringing_Sets", column: "Bringing_Set_ID", primary_key: "Bringing_Set_ID", name: "持参物セット", on_delete: :cascade
  add_foreign_key "Bringings_Bringing_Sets", "Bringings", column: "Bringing_ID", primary_key: "Bringing_ID", name: "持参物", on_delete: :cascade
  add_foreign_key "Commnets", "Memories", column: "Memory_ID", primary_key: "Memory_ID", name: "思い出", on_delete: :cascade
  add_foreign_key "Commnets", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "Event_Casts", "Events", column: "Event_ID", primary_key: "Event_ID", name: "イベント", on_delete: :cascade
  add_foreign_key "Event_Casts", "Oshis", column: "Oshi_ID", primary_key: "Oshi_ID", name: "推し", on_delete: :cascade
  add_foreign_key "Event_Remarks", "Bringing_Sets", column: "Bringing_Set_ID", primary_key: "Bringing_Set_ID", name: "持参物セット", on_delete: :cascade
  add_foreign_key "Event_Remarks", "Events", column: "Event_ID", primary_key: "Event_ID", name: "イベント", on_delete: :cascade
  add_foreign_key "Event_Remarks", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "Events", "Event_Categories", column: "Event_Category_ID", primary_key: "Event_Category_ID", name: "イベントカテゴリ"
  add_foreign_key "Events", "Prefectures", column: "Hold_Prefecture", primary_key: "Prefecture_ID", name: "県", on_update: :nullify, on_delete: :nullify
  add_foreign_key "Likes", "Memories", column: "Memory_ID", primary_key: "Memory_ID", name: "思い出", on_delete: :cascade
  add_foreign_key "Likes", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "Memories", "Events", column: "Event_ID", primary_key: "Event_ID", name: "イベント", on_delete: :cascade
  add_foreign_key "Memories", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "My_Oshis", "Oshis", column: "Oshi_ID", primary_key: "Oshi_ID", name: "推し", on_delete: :cascade
  add_foreign_key "My_Oshis", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "Oshis", "Jobs", column: "Job_ID", primary_key: "Job_ID", name: "職業", on_update: :nullify, on_delete: :nullify
  add_foreign_key "Oshis", "Offices", column: "Affiliation_ID", primary_key: "Office_ID", name: "所属", on_update: :nullify, on_delete: :nullify
  add_foreign_key "Profiels", "Prefectures", column: "Prefecture_ID", primary_key: "Prefecture_ID", name: "県", on_update: :nullify, on_delete: :nullify
  add_foreign_key "Schedules", "Events", column: "Event_ID", primary_key: "Event_ID", name: "イベント", on_delete: :cascade
  add_foreign_key "Schedules", "Profiels", column: "User_ID", primary_key: "User_ID", name: "ユーザ", on_delete: :cascade
  add_foreign_key "Set_Lists", "Musics", column: "Music_ID", primary_key: "Music_ID", name: "音楽", on_delete: :cascade
end
