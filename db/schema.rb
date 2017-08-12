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

ActiveRecord::Schema.define(version: 20170812011912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "eventdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eventpic"
    t.integer "profile_id"
    t.string "venue"
    t.datetime "end_date"
    t.index ["profile_id", "created_at"], name: "index_events_on_profile_id_and_created_at"
  end

  create_table "hows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "howcover"
    t.string "video"
    t.datetime "duration"
    t.text "recipetips"
    t.string "slug"
    t.string "subtitle"
    t.string "subtitle1"
    t.string "subtitle2"
    t.string "subtitle3"
    t.text "subbody1"
    t.text "subbody2"
    t.text "subbody3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id", "created_at"], name: "index_hows_on_profile_id_and_created_at"
  end

  create_table "impressions", id: :serial, force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.integer "profile_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["profile_id"], name: "index_impressions_on_profile_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_locations_on_slug"
  end

  create_table "profiles", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "displayname"
    t.datetime "date_of_birth"
    t.boolean "is_female", default: false
    t.string "pesnavatar"
    t.string "profilecover"
    t.boolean "admin", default: false
    t.text "summary"
    t.string "slug"
    t.index ["confirmation_token"], name: "index_profiles_on_confirmation_token", unique: true
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["reset_password_token"], name: "index_profiles_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_profiles_on_slug"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "songcover"
    t.string "audio"
    t.text "lyricsbody1"
    t.text "lyricschorus1"
    t.text "lyricsbody2"
    t.text "lyricschorus2"
    t.text "lyricsbody3"
    t.text "lyricschorus3"
    t.string "youtubeurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "slug"
    t.index ["profile_id", "created_at"], name: "index_songs_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_songs_on_slug"
  end

  create_table "thing_locations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "location_id"
    t.integer "profile_id"
  end

  create_table "urbanterms", force: :cascade do |t|
    t.string "title"
    t.text "meaning1"
    t.text "meaning2"
    t.text "origin"
    t.text "example1"
    t.text "example2"
    t.text "example3"
    t.text "example4"
    t.string "termcover"
    t.string "termaudio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

end
