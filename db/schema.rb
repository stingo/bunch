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

ActiveRecord::Schema.define(version: 20171231124355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_artists_on_profile_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "profile_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
    t.integer "echo_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["echo_id"], name: "index_comments_on_echo_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "companylogo"
    t.string "companycover"
    t.string "slug"
    t.string "websiteurl"
    t.integer "profile_id"
    t.text "services"
    t.datetime "yearfounded"
    t.string "companyemail"
    t.bigint "contactphone"
    t.string "video1"
    t.string "video2"
    t.string "facebookurl"
    t.string "twitterurl"
    t.string "linkedinurl"
    t.string "googleplusurl"
    t.string "pinteresturl"
    t.string "instagramurl"
    t.integer "companytype_id"
    t.string "companysize"
    t.integer "companysize_id"
    t.index ["companysize"], name: "index_companies_on_companysize"
    t.index ["companysize_id"], name: "index_companies_on_companysize_id"
    t.index ["companytype_id"], name: "index_companies_on_companytype_id"
    t.index ["profile_id", "created_at"], name: "index_companies_on_profile_id_and_created_at"
  end

  create_table "companysizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companytypes", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id", "created_at"], name: "index_companytypes_on_profile_id_and_created_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "slug"
    t.index ["profile_id", "created_at"], name: "index_countries_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_countries_on_slug"
  end

  create_table "echocategories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "echocatimage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "profile_id"
    t.index ["profile_id", "created_at"], name: "index_echocategories_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_echocategories_on_slug"
  end

  create_table "echos", force: :cascade do |t|
    t.string "headline"
    t.text "body"
    t.string "image1"
    t.string "videourl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "slug"
    t.string "echoimage1"
    t.string "echoimage2"
    t.integer "echocategory_id"
    t.text "content2"
    t.text "acknowledgments"
    t.text "references"
    t.integer "rating"
    t.index ["content2"], name: "index_echos_on_content2"
    t.index ["echoimage1"], name: "index_echos_on_echoimage1"
    t.index ["echoimage2"], name: "index_echos_on_echoimage2"
    t.index ["profile_id", "created_at"], name: "index_echos_on_profile_id_and_created_at"
    t.index ["rating"], name: "index_echos_on_rating"
    t.index ["slug"], name: "index_echos_on_slug"
  end

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

  create_table "follows", id: :serial, force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "howcategories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id", "created_at"], name: "index_howcategories_on_profile_id_and_created_at"
  end

  create_table "hows", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "howcover"
    t.string "videourl"
    t.datetime "minutes"
    t.text "hints_and_tips"
    t.string "slug"
    t.string "subtitle"
    t.string "subtitle1"
    t.string "subtitle2"
    t.string "subtitle3"
    t.text "subbody1"
    t.text "subbody2"
    t.text "references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.integer "howcategory_id"
    t.datetime "hours"
    t.datetime "days"
    t.integer "rating"
    t.text "ingredients"
    t.index ["days"], name: "index_hows_on_days"
    t.index ["hours"], name: "index_hows_on_hours"
    t.index ["howcategory_id"], name: "index_hows_on_howcategory_id"
    t.index ["ingredients"], name: "index_hows_on_ingredients"
    t.index ["profile_id", "created_at"], name: "index_hows_on_profile_id_and_created_at"
    t.index ["rating"], name: "index_hows_on_rating"
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

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.integer "min_salary"
    t.integer "max_salary"
    t.integer "company_id"
    t.string "main_responsibilities"
    t.string "main_requirements"
    t.string "your_name"
    t.string "phone"
    t.integer "jobtype_id"
    t.string "job_url"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["jobtype_id"], name: "index_jobs_on_jobtype_id"
    t.index ["max_salary"], name: "index_jobs_on_max_salary"
    t.index ["min_salary"], name: "index_jobs_on_min_salary"
  end

  create_table "jobtypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "listingimages"
    t.string "slug"
    t.integer "profile_id"
    t.index ["profile_id", "created_at"], name: "index_listings_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_listings_on_slug"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_locations_on_slug"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.json "listingimages"
    t.index ["profile_id", "created_at"], name: "index_products_on_profile_id_and_created_at"
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

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
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
    t.string "sound"
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["profile_id", "created_at"], name: "index_songs_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_songs_on_slug"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "thing_companies", force: :cascade do |t|
    t.integer "job_id"
    t.integer "profile_id"
    t.integer "listing_id"
    t.integer "company_id"
    t.integer "event_id"
    t.index ["company_id"], name: "index_thing_companies_on_company_id"
    t.index ["event_id"], name: "index_thing_companies_on_event_id"
    t.index ["listing_id"], name: "index_thing_companies_on_listing_id"
  end

  create_table "thing_countries", force: :cascade do |t|
    t.integer "company_id"
    t.integer "country_id"
    t.index ["country_id"], name: "index_thing_countries_on_country_id"
  end

  create_table "thing_industries", force: :cascade do |t|
    t.integer "company_id"
    t.integer "job_id"
    t.integer "profile_id"
    t.integer "industry_id"
    t.index ["industry_id"], name: "index_thing_industries_on_industry_id"
  end

  create_table "thing_locations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "location_id"
    t.integer "profile_id"
    t.integer "job_id"
    t.integer "company_id"
  end

  create_table "thing_skills", force: :cascade do |t|
    t.integer "job_id"
    t.integer "skill_id"
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
    t.integer "profile_id"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_urbanterms_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_urbanterms_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_urbanterms_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_urbanterms_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_urbanterms_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_urbanterms_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_urbanterms_on_cached_weighted_total"
    t.index ["profile_id", "created_at"], name: "index_urbanterms_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_urbanterms_on_slug"
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
