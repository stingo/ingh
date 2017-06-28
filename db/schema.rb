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

ActiveRecord::Schema.define(version: 20170625232906) do

  create_table "comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "profile_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "hows", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "body"
    t.string "howcover"
    t.string "video"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.string "subtitle1"
    t.string "subtitle2"
    t.string "subtitle3"
    t.string "subtitle4"
    t.text "subbody1"
    t.text "subbody2"
    t.text "subbody3"
    t.text "subbody4"
    t.integer "days"
    t.integer "hours"
    t.integer "minutes"
    t.text "recipetips"
    t.string "slug"
    t.index ["profile_id"], name: "index_hows_on_profile_id"
    t.index ["slug"], name: "index_hows_on_slug", unique: true
  end

  create_table "impressions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", length: { params: 255 }
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: { message: 255 }
    t.index ["profile_id"], name: "index_impressions_on_profile_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "pagecontacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "postal_code"
    t.string "pageemail"
    t.string "business_number"
    t.string "cell_number"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.string "avatar"
    t.integer "typ_contact_id"
    t.integer "typ_country_id"
    t.integer "typ_region_id"
    t.integer "typ_town_id"
    t.integer "page_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_pagecontacts_on_page_id"
    t.index ["profile_id"], name: "index_pagecontacts_on_profile_id"
    t.index ["typ_contact_id"], name: "index_pagecontacts_on_typ_contact_id"
    t.index ["typ_country_id"], name: "index_pagecontacts_on_typ_country_id"
    t.index ["typ_region_id"], name: "index_pagecontacts_on_typ_region_id"
    t.index ["typ_town_id"], name: "index_pagecontacts_on_typ_town_id"
  end

  create_table "pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "pagedesc"
    t.string "pageavatar"
    t.string "verification_doc"
    t.boolean "verified"
    t.integer "typ_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_page_id"], name: "index_pages_on_typ_page_id"
  end

  create_table "pesn_contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address1"
    t.string "address2"
    t.string "city", null: false
    t.string "postal_code"
    t.string "email", null: false
    t.string "cell_number"
    t.string "pesnavatar"
    t.integer "typ_contact_id"
    t.integer "typ_country_id"
    t.integer "typ_region_id"
    t.integer "typ_town_id"
    t.integer "page_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_pesn_contacts_on_page_id"
    t.index ["profile_id"], name: "index_pesn_contacts_on_profile_id"
    t.index ["typ_contact_id"], name: "index_pesn_contacts_on_typ_contact_id"
    t.index ["typ_country_id"], name: "index_pesn_contacts_on_typ_country_id"
    t.index ["typ_region_id"], name: "index_pesn_contacts_on_typ_region_id"
    t.index ["typ_town_id"], name: "index_pesn_contacts_on_typ_town_id"
  end

  create_table "profiles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "typ_position_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "displayname"
    t.datetime "date_of_birth"
    t.boolean "is_female", default: false
    t.string "pesnavatar"
    t.string "slug"
    t.text "summary"
    t.string "profilecover"
    t.string "loctown"
    t.string "loccountry"
    t.string "currjobtitle"
    t.string "currtemployer"
    t.datetime "curremployerstartdate"
    t.string "employer2name"
    t.string "employer2jobtitle"
    t.datetime "employer2startdate"
    t.datetime "employer2finishdate"
    t.string "employer3name"
    t.string "employer3jobtitle"
    t.datetime "employer3startdate"
    t.datetime "employer3finishdate"
    t.string "employer4name"
    t.string "employer4jobtitle"
    t.datetime "employer4startdate"
    t.datetime "employer4finishdate"
    t.string "recentqualificationtitle"
    t.string "recentqualificationname"
    t.string "recentschoolname"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_profiles_on_confirmation_token", unique: true
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["page_id"], name: "index_profiles_on_page_id"
    t.index ["reset_password_token"], name: "index_profiles_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_profiles_on_slug", unique: true
    t.index ["typ_position_id"], name: "index_profiles_on_typ_position_id"
  end

  create_table "taggings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "typ_countries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "iso"
    t.string "iso3"
    t.string "fips"
    t.string "country"
    t.string "continent"
    t.string "currency_code"
    t.string "currency_name"
    t.string "phone_prefix"
    t.string "postal_code"
    t.string "geonameid"
  end

  create_table "typ_pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_positions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typ_regions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "timezone"
    t.integer "typ_country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_country_id"], name: "index_typ_regions_on_typ_country_id"
  end

  create_table "typ_towns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "typ_country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typ_country_id"], name: "index_typ_towns_on_typ_country_id"
  end

  create_table "urban_terms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.text "inaction"
    t.string "postcover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "urbantermcover"
    t.string "slug"
    t.index ["profile_id", "created_at"], name: "index_urban_terms_on_profile_id_and_created_at"
    t.index ["slug"], name: "index_urban_terms_on_slug", unique: true
  end

  create_table "votes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "hows", "profiles"
end
