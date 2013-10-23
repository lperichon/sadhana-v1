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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131023052238) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "authentications", :force => true do |t|
    t.integer "user_id"
    t.string  "provider"
    t.string  "uid"
    t.string  "token"
  end

  create_table "part_translations", :force => true do |t|
    t.integer  "part_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "part_translations", ["part_id", "locale"], :name => "index_part_translations_on_part_id_and_locale", :unique => true

  create_table "parts", :force => true do |t|
    t.string  "symbol"
    t.integer "technique_type_id"
  end

  create_table "parts_technique_types", :id => false, :force => true do |t|
    t.integer "part_id"
    t.integer "technique_type_id"
  end

  create_table "practice_events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "practice_id"
    t.datetime "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practice_parts", :force => true do |t|
    t.integer  "practice_id"
    t.integer  "part_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practice_techniques", :force => true do |t|
    t.integer  "practice_id"
    t.integer  "technique_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "minutes"
    t.integer  "seconds"
    t.boolean  "compensate"
    t.text     "observations"
    t.integer  "practice_part_id"
  end

  create_table "practice_techniques_techniques", :id => false, :force => true do |t|
    t.integer "practice_technique_id"
    t.integer "technique_id"
  end

  create_table "practices", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delay"
    t.integer  "user_id"
    t.integer  "position"
    t.boolean  "continuous"
    t.string   "sound_filename"
    t.string   "state",          :default => "created"
    t.boolean  "public"
    t.boolean  "one_sec_a_day",  :default => false
  end

  create_table "shared_practices", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "practice_id"
  end

  create_table "subscription_plans", :force => true do |t|
    t.string   "name",                                      :null => false
    t.integer  "rate_cents",             :default => 0
    t.integer  "interval",               :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_practices"
    t.boolean  "available"
    t.boolean  "share_practices",        :default => false
    t.boolean  "one_sec_a_day_training", :default => false
    t.string   "stripe_id"
  end

  create_table "subscription_profiles", :force => true do |t|
    t.integer  "subscription_id"
    t.string   "state"
    t.string   "profile_key"
    t.string   "card_first_name"
    t.string   "card_last_name"
    t.string   "card_type"
    t.string   "card_display_number"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_transactions", :force => true do |t|
    t.integer  "subscription_id", :null => false
    t.integer  "amount_cents"
    t.boolean  "success"
    t.string   "reference"
    t.string   "message"
    t.string   "action"
    t.text     "params"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "subscriber_id",                        :null => false
    t.string   "subscriber_type",                      :null => false
    t.integer  "plan_id"
    t.string   "state"
    t.date     "next_renewal_on"
    t.integer  "warning_level"
    t.integer  "balance_cents",         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
  end

  add_index "subscriptions", ["next_renewal_on"], :name => "index_subscriptions_on_next_renewal_on"
  add_index "subscriptions", ["state"], :name => "index_subscriptions_on_state"
  add_index "subscriptions", ["subscriber_id"], :name => "index_subscriptions_on_subscriber_id"
  add_index "subscriptions", ["subscriber_type"], :name => "index_subscriptions_on_subscriber_type"

  create_table "technique_categories", :force => true do |t|
    t.integer "code"
  end

  create_table "technique_category_translations", :force => true do |t|
    t.integer  "technique_category_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_translations", :force => true do |t|
    t.integer  "technique_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technique_translations", ["technique_id", "locale"], :name => "index_technique_translations_on_technique_id_and_locale", :unique => true

  create_table "technique_type_translations", :force => true do |t|
    t.integer  "technique_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "symbol"
  end

  create_table "techniques", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "technique_type_id"
    t.string   "code"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "parent_id"
    t.integer  "technique_category_id"
  end

  create_table "user_contacts", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "contact_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "password_salt",                        :default => ""
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
    t.string   "invitation_token",       :limit => 20
    t.datetime "invitation_sent_at"
    t.text     "google_consumer"
    t.text     "yahoo_consumer"
    t.datetime "reset_password_sent_at"
    t.integer  "invited_by_id"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
