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

ActiveRecord::Schema.define(version: 20180127141925) do

  create_table "applicants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_applicants_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_applicants_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_applicants_on_user_id", using: :btree
  end

  create_table "clips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_clips_on_event_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_clips_on_user_id_and_event_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_clips_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "profile"
    t.string   "image"
    t.string   "twitter",      default: ""
    t.string   "facebook",     default: ""
    t.string   "officiallink", default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "companymembers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.boolean  "owner",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["company_id"], name: "index_companymembers_on_company_id", using: :btree
    t.index ["user_id", "company_id"], name: "index_companymembers_on_user_id_and_company_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_companymembers_on_user_id", using: :btree
  end

  create_table "companyrelationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_companyrelationships_on_company_id", using: :btree
    t.index ["user_id", "company_id"], name: "index_companyrelationships_on_user_id_and_company_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_companyrelationships_on_user_id", using: :btree
  end

  create_table "eventcomments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventcomments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_eventcomments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "place"
    t.string   "content"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_events_on_company_id", using: :btree
    t.index ["group_id"], name: "index_events_on_group_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id", using: :btree
    t.index ["user_id", "post_id"], name: "index_favorites_on_user_id_and_post_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "grouprelationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_grouprelationships_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_grouprelationships_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_grouprelationships_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "group_id"
    t.string   "profile"
    t.string   "image"
    t.string   "twitter",    default: ""
    t.string   "facebook",   default: ""
    t.string   "instagram",  default: ""
    t.string   "otherlinka", default: ""
    t.string   "otherlinkb", default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "joins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_joins_on_event_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_joins_on_user_id_and_event_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_joins_on_user_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "owner",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["group_id"], name: "index_members_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_members_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title"
    t.string   "link"
    t.string   "img"
    t.string   "date"
    t.string   "source"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "content"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_posts_on_company_id", using: :btree
    t.index ["group_id"], name: "index_posts_on_group_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id", using: :btree
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "title"
    t.string   "userstatus"
    t.string   "content"
    t.boolean  "public",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["company_id"], name: "index_reviews_on_company_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "profile"
    t.string   "image"
    t.string   "highschool"
    t.string   "college"
    t.string   "grschool"
    t.string   "major"
    t.string   "job"
    t.string   "gyokai"
    t.string   "occupation"
    t.string   "twitter",         default: ""
    t.string   "facebook",        default: ""
    t.string   "instagram",       default: ""
    t.string   "linkedin",        default: ""
    t.string   "otherlinka",      default: ""
    t.string   "otherlinkb",      default: ""
    t.string   "password_digest"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "applicants", "groups"
  add_foreign_key "applicants", "users"
  add_foreign_key "clips", "events"
  add_foreign_key "clips", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "companymembers", "companies"
  add_foreign_key "companymembers", "users"
  add_foreign_key "companyrelationships", "companies"
  add_foreign_key "companyrelationships", "users"
  add_foreign_key "eventcomments", "events"
  add_foreign_key "eventcomments", "users"
  add_foreign_key "events", "companies"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "users"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "grouprelationships", "groups"
  add_foreign_key "grouprelationships", "users"
  add_foreign_key "joins", "events"
  add_foreign_key "joins", "users"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "posts", "companies"
  add_foreign_key "posts", "groups"
  add_foreign_key "posts", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "reviews", "companies"
  add_foreign_key "reviews", "users"
end
