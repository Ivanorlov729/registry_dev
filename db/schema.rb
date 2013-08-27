# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130827020659) do

  create_table "actions", :primary_key => "aid", :force => true do |t|
    t.string "type",       :limit => 32,         :default => "",  :null => false
    t.string "callback",                         :default => "",  :null => false
    t.binary "parameters", :limit => 2147483647,                  :null => false
    t.string "label",                            :default => "0", :null => false
  end

  create_table "authmap", :primary_key => "aid", :force => true do |t|
    t.integer "uid",                     :default => 0,  :null => false
    t.string  "authname", :limit => 128, :default => "", :null => false
    t.string  "module",   :limit => 128, :default => "", :null => false
  end

  add_index "authmap", ["authname"], :name => "authname", :unique => true

  create_table "batch", :primary_key => "bid", :force => true do |t|
    t.string  "token",     :limit => 64,         :null => false
    t.integer "timestamp",                       :null => false
    t.binary  "batch",     :limit => 2147483647
  end

  add_index "batch", ["token"], :name => "token"

  create_table "block", :primary_key => "bid", :force => true do |t|
    t.string  "module",     :limit => 64, :default => "",  :null => false
    t.string  "delta",      :limit => 32, :default => "0", :null => false
    t.string  "theme",      :limit => 64, :default => "",  :null => false
    t.integer "status",     :limit => 1,  :default => 0,   :null => false
    t.integer "weight",                   :default => 0,   :null => false
    t.string  "region",     :limit => 64, :default => "",  :null => false
    t.integer "custom",     :limit => 1,  :default => 0,   :null => false
    t.integer "visibility", :limit => 1,  :default => 0,   :null => false
    t.text    "pages",                                     :null => false
    t.string  "title",      :limit => 64, :default => "",  :null => false
    t.integer "cache",      :limit => 1,  :default => 1,   :null => false
  end

  add_index "block", ["theme", "module", "delta"], :name => "tmd", :unique => true
  add_index "block", ["theme", "status", "region", "weight", "module"], :name => "list"

  create_table "block_custom", :primary_key => "bid", :force => true do |t|
    t.text   "body",   :limit => 2147483647
    t.string "info",   :limit => 128,        :default => "", :null => false
    t.string "format"
  end

  add_index "block_custom", ["info"], :name => "info", :unique => true

  create_table "block_node_type", :id => false, :force => true do |t|
    t.string "module", :limit => 64, :null => false
    t.string "delta",  :limit => 32, :null => false
    t.string "type",   :limit => 32, :null => false
  end

  add_index "block_node_type", ["type"], :name => "type"

  create_table "block_role", :id => false, :force => true do |t|
    t.string  "module", :limit => 64, :null => false
    t.string  "delta",  :limit => 32, :null => false
    t.integer "rid",                  :null => false
  end

  add_index "block_role", ["rid"], :name => "rid"

  create_table "blocked_ips", :primary_key => "iid", :force => true do |t|
    t.string "ip", :limit => 40, :default => "", :null => false
  end

  add_index "blocked_ips", ["ip"], :name => "blocked_ip"

  create_table "cache", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache", ["expire"], :name => "expire"

  create_table "cache_block", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_block", ["expire"], :name => "expire"

  create_table "cache_bootstrap", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_bootstrap", ["expire"], :name => "expire"

  create_table "cache_field", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_field", ["expire"], :name => "expire"

  create_table "cache_filter", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_filter", ["expire"], :name => "expire"

  create_table "cache_form", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_form", ["expire"], :name => "expire"

  create_table "cache_image", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_image", ["expire"], :name => "expire"

  create_table "cache_menu", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_menu", ["expire"], :name => "expire"

  create_table "cache_page", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_page", ["expire"], :name => "expire"

  create_table "cache_path", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_path", ["expire"], :name => "expire"

  create_table "cache_rules", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_rules", ["expire"], :name => "expire"

  create_table "cache_token", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_token", ["expire"], :name => "expire"

  create_table "cache_update", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_update", ["expire"], :name => "expire"

  create_table "cache_views", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 0, :null => false
  end

  add_index "cache_views", ["expire"], :name => "expire"

  create_table "cache_views_data", :primary_key => "cid", :force => true do |t|
    t.binary  "data",       :limit => 2147483647
    t.integer "expire",                           :default => 0, :null => false
    t.integer "created",                          :default => 0, :null => false
    t.integer "serialized", :limit => 2,          :default => 1, :null => false
  end

  add_index "cache_views_data", ["expire"], :name => "expire"

  create_table "co_registrant_infos", :force => true do |t|
    t.integer  "luxe_registry_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "use_regis_addr"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "daytime_phone"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "comment", :primary_key => "cid", :force => true do |t|
    t.integer "pid",                     :default => 0,  :null => false
    t.integer "nid",                     :default => 0,  :null => false
    t.integer "uid",                     :default => 0,  :null => false
    t.string  "subject",  :limit => 64,  :default => "", :null => false
    t.string  "hostname", :limit => 128, :default => "", :null => false
    t.integer "created",                 :default => 0,  :null => false
    t.integer "changed",                 :default => 0,  :null => false
    t.integer "status",   :limit => 1,   :default => 1,  :null => false
    t.string  "thread",                                  :null => false
    t.string  "name",     :limit => 60
    t.string  "mail",     :limit => 64
    t.string  "homepage"
    t.string  "language", :limit => 12,  :default => "", :null => false
  end

  add_index "comment", ["created"], :name => "comment_created"
  add_index "comment", ["nid", "language"], :name => "comment_nid_language"
  add_index "comment", ["nid", "status", "created", "cid", "thread"], :name => "comment_num_new"
  add_index "comment", ["pid", "status"], :name => "comment_status_pid"
  add_index "comment", ["uid"], :name => "comment_uid"

  create_table "commerce_calculated_price", :id => false, :force => true do |t|
    t.string  "module",                              :default => "", :null => false
    t.text    "module_key",    :limit => 16777215,                   :null => false
    t.string  "entity_type",                         :default => "", :null => false
    t.integer "entity_id",                           :default => 0,  :null => false
    t.string  "field_name",    :limit => 32,         :default => "", :null => false
    t.string  "language",      :limit => 32,         :default => "", :null => false
    t.integer "delta",                               :default => 0,  :null => false
    t.integer "amount",                              :default => 0,  :null => false
    t.string  "currency_code", :limit => 32,                         :null => false
    t.text    "data",          :limit => 2147483647
    t.integer "created",                             :default => 0,  :null => false
  end

  add_index "commerce_calculated_price", ["entity_id"], :name => "entity_id"
  add_index "commerce_calculated_price", ["entity_type"], :name => "entity_type"
  add_index "commerce_calculated_price", ["module"], :name => "module"

  create_table "commerce_checkout_pane", :primary_key => "pane_id", :force => true do |t|
    t.string  "page",                     :default => "1", :null => false
    t.integer "fieldset",    :limit => 1, :default => 1,   :null => false
    t.integer "collapsible", :limit => 1, :default => 0,   :null => false
    t.integer "collapsed",   :limit => 1, :default => 0,   :null => false
    t.integer "weight",      :limit => 2, :default => 0,   :null => false
    t.integer "enabled",     :limit => 1, :default => 1,   :null => false
    t.integer "review",      :limit => 1, :default => 1,   :null => false
  end

  create_table "commerce_customer_profile", :primary_key => "profile_id", :force => true do |t|
    t.integer "revision_id"
    t.string  "type",                              :default => "", :null => false
    t.integer "uid",                               :default => 0,  :null => false
    t.integer "status",                            :default => 0,  :null => false
    t.integer "created",                           :default => 0,  :null => false
    t.integer "changed",                           :default => 0,  :null => false
    t.binary  "data",        :limit => 2147483647
  end

  add_index "commerce_customer_profile", ["revision_id"], :name => "revision_id", :unique => true
  add_index "commerce_customer_profile", ["type"], :name => "customer_profile_type"
  add_index "commerce_customer_profile", ["uid", "type"], :name => "uid_by_type"
  add_index "commerce_customer_profile", ["uid"], :name => "uid"

  create_table "commerce_customer_profile_revision", :primary_key => "revision_id", :force => true do |t|
    t.integer "profile_id",                               :default => 0, :null => false
    t.integer "revision_uid",                             :default => 0, :null => false
    t.integer "status",                                   :default => 0, :null => false
    t.text    "log",                :limit => 2147483647,                :null => false
    t.integer "revision_timestamp",                       :default => 0, :null => false
    t.binary  "data",               :limit => 2147483647
  end

  add_index "commerce_customer_profile_revision", ["profile_id"], :name => "profile_id"

  create_table "commerce_line_item", :primary_key => "line_item_id", :force => true do |t|
    t.integer "order_id",                                                             :default => 0,   :null => false
    t.string  "type",                                                                 :default => "",  :null => false
    t.string  "line_item_label",                                                                       :null => false
    t.decimal "quantity",                              :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer "created",                                                              :default => 0,   :null => false
    t.integer "changed",                                                              :default => 0,   :null => false
    t.binary  "data",            :limit => 2147483647
  end

  add_index "commerce_line_item", ["order_id"], :name => "order_id"
  add_index "commerce_line_item", ["type"], :name => "line_item_type"

  create_table "commerce_order", :primary_key => "order_id", :force => true do |t|
    t.string  "order_number"
    t.integer "revision_id"
    t.string  "type",                               :default => "", :null => false
    t.integer "uid",                                :default => 0,  :null => false
    t.string  "mail",                               :default => "", :null => false
    t.string  "status",                                             :null => false
    t.integer "created",                            :default => 0,  :null => false
    t.integer "changed",                            :default => 0,  :null => false
    t.string  "hostname",     :limit => 128,        :default => "", :null => false
    t.binary  "data",         :limit => 2147483647
  end

  add_index "commerce_order", ["order_number"], :name => "order_number", :unique => true
  add_index "commerce_order", ["revision_id"], :name => "revision_id", :unique => true
  add_index "commerce_order", ["uid"], :name => "uid"

  create_table "commerce_order_revision", :primary_key => "revision_id", :force => true do |t|
    t.integer "order_id",                                 :default => 0,  :null => false
    t.string  "order_number"
    t.integer "revision_uid",                             :default => 0,  :null => false
    t.string  "mail",                                                     :null => false
    t.string  "status",                                                   :null => false
    t.text    "log",                :limit => 2147483647,                 :null => false
    t.integer "revision_timestamp",                       :default => 0,  :null => false
    t.string  "revision_hostname",  :limit => 128,        :default => "", :null => false
    t.binary  "data",               :limit => 2147483647
  end

  add_index "commerce_order_revision", ["order_id"], :name => "order_id"

  create_table "commerce_payment_transaction", :primary_key => "transaction_id", :force => true do |t|
    t.integer "revision_id"
    t.integer "uid",                                     :default => 0, :null => false
    t.integer "order_id",                                :default => 0, :null => false
    t.string  "payment_method",    :limit => 128,                       :null => false
    t.string  "instance_id",                                            :null => false
    t.string  "remote_id",                                              :null => false
    t.text    "message",           :limit => 2147483647,                :null => false
    t.binary  "message_variables", :limit => 2147483647,                :null => false
    t.integer "amount",                                  :default => 0, :null => false
    t.string  "currency_code",     :limit => 32,                        :null => false
    t.string  "status",            :limit => 128,                       :null => false
    t.string  "remote_status",     :limit => 128,                       :null => false
    t.binary  "payload",           :limit => 2147483647,                :null => false
    t.integer "created",                                 :default => 0, :null => false
    t.integer "changed",                                 :default => 0, :null => false
    t.binary  "data",              :limit => 2147483647
  end

  add_index "commerce_payment_transaction", ["order_id"], :name => "order_id"
  add_index "commerce_payment_transaction", ["payment_method"], :name => "payment_method"
  add_index "commerce_payment_transaction", ["revision_id"], :name => "revision_id", :unique => true
  add_index "commerce_payment_transaction", ["uid"], :name => "uid"

  create_table "commerce_payment_transaction_revision", :primary_key => "revision_id", :force => true do |t|
    t.integer "transaction_id",                           :default => 0, :null => false
    t.integer "revision_uid",                             :default => 0, :null => false
    t.string  "remote_id",                                               :null => false
    t.text    "message",            :limit => 2147483647,                :null => false
    t.binary  "message_variables",  :limit => 2147483647,                :null => false
    t.integer "amount",                                   :default => 0, :null => false
    t.string  "currency_code",      :limit => 32,                        :null => false
    t.string  "status",             :limit => 128,                       :null => false
    t.string  "remote_status",      :limit => 128,                       :null => false
    t.text    "log",                :limit => 2147483647,                :null => false
    t.integer "revision_timestamp",                       :default => 0, :null => false
    t.binary  "data",               :limit => 2147483647
  end

  add_index "commerce_payment_transaction_revision", ["transaction_id"], :name => "transaction_id"

  create_table "commerce_product", :primary_key => "product_id", :force => true do |t|
    t.integer "revision_id"
    t.string  "sku",                                               :null => false
    t.string  "title",                             :default => "", :null => false
    t.string  "type",                              :default => "", :null => false
    t.string  "language",    :limit => 32,         :default => "", :null => false
    t.integer "uid",                               :default => 0,  :null => false
    t.integer "status",      :limit => 1,          :default => 1,  :null => false
    t.integer "created",                           :default => 0,  :null => false
    t.integer "changed",                           :default => 0,  :null => false
    t.binary  "data",        :limit => 2147483647
  end

  add_index "commerce_product", ["revision_id"], :name => "revision_id", :unique => true
  add_index "commerce_product", ["sku"], :name => "sku", :unique => true
  add_index "commerce_product", ["type"], :name => "product_type"
  add_index "commerce_product", ["uid"], :name => "uid"

  create_table "commerce_product_revision", :primary_key => "revision_id", :force => true do |t|
    t.integer "product_id",                               :default => 0,  :null => false
    t.string  "sku",                                                      :null => false
    t.string  "title",                                    :default => "", :null => false
    t.integer "revision_uid",                             :default => 0,  :null => false
    t.integer "status",             :limit => 1,          :default => 1,  :null => false
    t.text    "log",                :limit => 2147483647,                 :null => false
    t.integer "revision_timestamp",                       :default => 0,  :null => false
    t.binary  "data",               :limit => 2147483647
  end

  add_index "commerce_product_revision", ["product_id"], :name => "product_id"
  add_index "commerce_product_revision", ["revision_uid"], :name => "revision_uid"

  create_table "commerce_product_type", :primary_key => "type", :force => true do |t|
    t.string  "name",                            :default => "", :null => false
    t.text    "description", :limit => 16777215,                 :null => false
    t.text    "help",        :limit => 16777215,                 :null => false
    t.integer "revision",    :limit => 1,        :default => 1,  :null => false
  end

  create_table "ctools_css_cache", :primary_key => "cid", :force => true do |t|
    t.string  "filename"
    t.text    "css",      :limit => 2147483647
    t.integer "filter",   :limit => 1
  end

  create_table "ctools_object_cache", :id => false, :force => true do |t|
    t.string  "sid",     :limit => 64,                        :null => false
    t.string  "name",    :limit => 128,                       :null => false
    t.string  "obj",     :limit => 32,                        :null => false
    t.integer "updated",                       :default => 0, :null => false
    t.binary  "data",    :limit => 2147483647
  end

  add_index "ctools_object_cache", ["updated"], :name => "updated"

  create_table "date_format_locale", :id => false, :force => true do |t|
    t.string "format",   :limit => 100, :null => false
    t.string "type",     :limit => 64,  :null => false
    t.string "language", :limit => 12,  :null => false
  end

  create_table "date_format_type", :primary_key => "type", :force => true do |t|
    t.string  "title",                              :null => false
    t.integer "locked", :limit => 1, :default => 0, :null => false
  end

  add_index "date_format_type", ["title"], :name => "title"

  create_table "date_formats", :primary_key => "dfid", :force => true do |t|
    t.string  "format", :limit => 100,                :null => false
    t.string  "type",   :limit => 64,                 :null => false
    t.integer "locked", :limit => 1,   :default => 0, :null => false
  end

  add_index "date_formats", ["format", "type"], :name => "formats", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "field_config", :force => true do |t|
    t.string  "field_name",     :limit => 32,                         :null => false
    t.string  "type",           :limit => 128,                        :null => false
    t.string  "module",         :limit => 128,        :default => "", :null => false
    t.integer "active",         :limit => 1,          :default => 0,  :null => false
    t.string  "storage_type",   :limit => 128,                        :null => false
    t.string  "storage_module", :limit => 128,        :default => "", :null => false
    t.integer "storage_active", :limit => 1,          :default => 0,  :null => false
    t.integer "locked",         :limit => 1,          :default => 0,  :null => false
    t.binary  "data",           :limit => 2147483647,                 :null => false
    t.integer "cardinality",    :limit => 1,          :default => 0,  :null => false
    t.integer "translatable",   :limit => 1,          :default => 0,  :null => false
    t.integer "deleted",        :limit => 1,          :default => 0,  :null => false
  end

  add_index "field_config", ["active"], :name => "active"
  add_index "field_config", ["deleted"], :name => "deleted"
  add_index "field_config", ["field_name"], :name => "field_name"
  add_index "field_config", ["module"], :name => "module"
  add_index "field_config", ["storage_active"], :name => "storage_active"
  add_index "field_config", ["storage_module"], :name => "storage_module"
  add_index "field_config", ["storage_type"], :name => "storage_type"
  add_index "field_config", ["type"], :name => "type"

  create_table "field_config_instance", :force => true do |t|
    t.integer "field_id",                                          :null => false
    t.string  "field_name",  :limit => 32,         :default => "", :null => false
    t.string  "entity_type", :limit => 32,         :default => "", :null => false
    t.string  "bundle",      :limit => 128,        :default => "", :null => false
    t.binary  "data",        :limit => 2147483647,                 :null => false
    t.integer "deleted",     :limit => 1,          :default => 0,  :null => false
  end

  add_index "field_config_instance", ["deleted"], :name => "deleted"
  add_index "field_config_instance", ["field_name", "entity_type", "bundle"], :name => "field_name_bundle"

  create_table "field_data_body", :id => false, :force => true do |t|
    t.string  "entity_type",  :limit => 128,        :default => "", :null => false
    t.string  "bundle",       :limit => 128,        :default => "", :null => false
    t.integer "deleted",      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                          :null => false
    t.integer "revision_id"
    t.string  "language",     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                              :null => false
    t.text    "body_value",   :limit => 2147483647
    t.text    "body_summary", :limit => 2147483647
    t.string  "body_format"
  end

  add_index "field_data_body", ["body_format"], :name => "body_format"
  add_index "field_data_body", ["bundle"], :name => "bundle"
  add_index "field_data_body", ["deleted"], :name => "deleted"
  add_index "field_data_body", ["entity_id"], :name => "entity_id"
  add_index "field_data_body", ["entity_type"], :name => "entity_type"
  add_index "field_data_body", ["language"], :name => "language"
  add_index "field_data_body", ["revision_id"], :name => "revision_id"

  create_table "field_data_comment_body", :id => false, :force => true do |t|
    t.string  "entity_type",         :limit => 128,        :default => "", :null => false
    t.string  "bundle",              :limit => 128,        :default => "", :null => false
    t.integer "deleted",             :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                 :null => false
    t.integer "revision_id"
    t.string  "language",            :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                     :null => false
    t.text    "comment_body_value",  :limit => 2147483647
    t.string  "comment_body_format"
  end

  add_index "field_data_comment_body", ["bundle"], :name => "bundle"
  add_index "field_data_comment_body", ["comment_body_format"], :name => "comment_body_format"
  add_index "field_data_comment_body", ["deleted"], :name => "deleted"
  add_index "field_data_comment_body", ["entity_id"], :name => "entity_id"
  add_index "field_data_comment_body", ["entity_type"], :name => "entity_type"
  add_index "field_data_comment_body", ["language"], :name => "language"
  add_index "field_data_comment_body", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_customer_address", :id => false, :force => true do |t|
    t.string  "entity_type",                                       :limit => 128,        :default => "", :null => false
    t.string  "bundle",                                            :limit => 128,        :default => "", :null => false
    t.integer "deleted",                                           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                               :null => false
    t.integer "revision_id"
    t.string  "language",                                          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                                   :null => false
    t.string  "commerce_customer_address_country",                 :limit => 2,          :default => ""
    t.string  "commerce_customer_address_administrative_area",                           :default => ""
    t.string  "commerce_customer_address_sub_administrative_area",                       :default => ""
    t.string  "commerce_customer_address_locality",                                      :default => ""
    t.string  "commerce_customer_address_dependent_locality",                            :default => ""
    t.string  "commerce_customer_address_postal_code",                                   :default => ""
    t.string  "commerce_customer_address_thoroughfare",                                  :default => ""
    t.string  "commerce_customer_address_premise",                                       :default => ""
    t.string  "commerce_customer_address_sub_premise",                                   :default => ""
    t.string  "commerce_customer_address_organisation_name",                             :default => ""
    t.string  "commerce_customer_address_name_line",                                     :default => ""
    t.string  "commerce_customer_address_first_name",                                    :default => ""
    t.string  "commerce_customer_address_last_name",                                     :default => ""
    t.text    "commerce_customer_address_data",                    :limit => 2147483647
  end

  add_index "field_data_commerce_customer_address", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_customer_address", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_customer_address", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_customer_address", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_customer_address", ["language"], :name => "language"
  add_index "field_data_commerce_customer_address", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_customer_billing", :id => false, :force => true do |t|
    t.string  "entity_type",                          :limit => 128, :default => "", :null => false
    t.string  "bundle",                               :limit => 128, :default => "", :null => false
    t.integer "deleted",                              :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                           :null => false
    t.integer "revision_id"
    t.string  "language",                             :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                               :null => false
    t.integer "commerce_customer_billing_profile_id"
  end

  add_index "field_data_commerce_customer_billing", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_customer_billing", ["commerce_customer_billing_profile_id"], :name => "commerce_customer_billing_profile_id"
  add_index "field_data_commerce_customer_billing", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_customer_billing", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_customer_billing", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_customer_billing", ["language"], :name => "language"
  add_index "field_data_commerce_customer_billing", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_display_path", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128, :default => "", :null => false
    t.string  "bundle",                       :limit => 128, :default => "", :null => false
    t.integer "deleted",                      :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                   :null => false
    t.integer "revision_id"
    t.string  "language",                     :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                       :null => false
    t.string  "commerce_display_path_value"
    t.string  "commerce_display_path_format"
  end

  add_index "field_data_commerce_display_path", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_display_path", ["commerce_display_path_format"], :name => "commerce_display_path_format"
  add_index "field_data_commerce_display_path", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_display_path", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_display_path", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_display_path", ["language"], :name => "language"
  add_index "field_data_commerce_display_path", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_line_items", :id => false, :force => true do |t|
    t.string  "entity_type",                      :limit => 128, :default => "", :null => false
    t.string  "bundle",                           :limit => 128, :default => "", :null => false
    t.integer "deleted",                          :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                       :null => false
    t.integer "revision_id"
    t.string  "language",                         :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                           :null => false
    t.integer "commerce_line_items_line_item_id"
  end

  add_index "field_data_commerce_line_items", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_line_items", ["commerce_line_items_line_item_id"], :name => "commerce_line_items_line_item_id"
  add_index "field_data_commerce_line_items", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_line_items", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_line_items", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_line_items", ["language"], :name => "language"
  add_index "field_data_commerce_line_items", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_order_total", :id => false, :force => true do |t|
    t.string  "entity_type",                        :limit => 128,        :default => "", :null => false
    t.string  "bundle",                             :limit => 128,        :default => "", :null => false
    t.integer "deleted",                            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                :null => false
    t.integer "revision_id"
    t.string  "language",                           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                    :null => false
    t.integer "commerce_order_total_amount",                              :default => 0,  :null => false
    t.string  "commerce_order_total_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_order_total_data",          :limit => 2147483647
  end

  add_index "field_data_commerce_order_total", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_order_total", ["commerce_order_total_amount", "commerce_order_total_currency_code"], :name => "commerce_order_total_currency_price"
  add_index "field_data_commerce_order_total", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_order_total", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_order_total", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_order_total", ["language"], :name => "language"
  add_index "field_data_commerce_order_total", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_price", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128,        :default => "", :null => false
    t.string  "bundle",                       :limit => 128,        :default => "", :null => false
    t.integer "deleted",                      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                          :null => false
    t.integer "revision_id"
    t.string  "language",                     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                              :null => false
    t.integer "commerce_price_amount",                              :default => 0,  :null => false
    t.string  "commerce_price_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_price_data",          :limit => 2147483647
  end

  add_index "field_data_commerce_price", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_price", ["commerce_price_amount", "commerce_price_currency_code"], :name => "commerce_price_currency_price"
  add_index "field_data_commerce_price", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_price", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_price", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_price", ["language"], :name => "language"
  add_index "field_data_commerce_price", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_product", :id => false, :force => true do |t|
    t.string  "entity_type",                 :limit => 128, :default => "", :null => false
    t.string  "bundle",                      :limit => 128, :default => "", :null => false
    t.integer "deleted",                     :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                  :null => false
    t.integer "revision_id"
    t.string  "language",                    :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                      :null => false
    t.integer "commerce_product_product_id"
  end

  add_index "field_data_commerce_product", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_product", ["commerce_product_product_id"], :name => "commerce_product_product_id"
  add_index "field_data_commerce_product", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_product", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_product", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_product", ["language"], :name => "language"
  add_index "field_data_commerce_product", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_total", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128,        :default => "", :null => false
    t.string  "bundle",                       :limit => 128,        :default => "", :null => false
    t.integer "deleted",                      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                          :null => false
    t.integer "revision_id"
    t.string  "language",                     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                              :null => false
    t.integer "commerce_total_amount",                              :default => 0,  :null => false
    t.string  "commerce_total_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_total_data",          :limit => 2147483647
  end

  add_index "field_data_commerce_total", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_total", ["commerce_total_amount", "commerce_total_currency_code"], :name => "commerce_total_currency_price"
  add_index "field_data_commerce_total", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_total", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_total", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_total", ["language"], :name => "language"
  add_index "field_data_commerce_total", ["revision_id"], :name => "revision_id"

  create_table "field_data_commerce_unit_price", :id => false, :force => true do |t|
    t.string  "entity_type",                       :limit => 128,        :default => "", :null => false
    t.string  "bundle",                            :limit => 128,        :default => "", :null => false
    t.integer "deleted",                           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                               :null => false
    t.integer "revision_id"
    t.string  "language",                          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                   :null => false
    t.integer "commerce_unit_price_amount",                              :default => 0,  :null => false
    t.string  "commerce_unit_price_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_unit_price_data",          :limit => 2147483647
  end

  add_index "field_data_commerce_unit_price", ["bundle"], :name => "bundle"
  add_index "field_data_commerce_unit_price", ["commerce_unit_price_amount", "commerce_unit_price_currency_code"], :name => "commerce_unit_price_currency_price"
  add_index "field_data_commerce_unit_price", ["deleted"], :name => "deleted"
  add_index "field_data_commerce_unit_price", ["entity_id"], :name => "entity_id"
  add_index "field_data_commerce_unit_price", ["entity_type"], :name => "entity_type"
  add_index "field_data_commerce_unit_price", ["language"], :name => "language"
  add_index "field_data_commerce_unit_price", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_1_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_1_box_value",  :limit => 2147483647
    t.string  "field_1_tab_1_box_format"
  end

  add_index "field_data_field_1_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_1_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_1_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_1_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_1_tab_1_box", ["field_1_tab_1_box_format"], :name => "field_1_tab_1_box_format"
  add_index "field_data_field_1_tab_1_box", ["language"], :name => "language"
  add_index "field_data_field_1_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_1_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_2_box_value",  :limit => 2147483647
    t.string  "field_1_tab_2_box_format"
  end

  add_index "field_data_field_1_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_1_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_1_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_1_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_1_tab_2_box", ["field_1_tab_2_box_format"], :name => "field_1_tab_2_box_format"
  add_index "field_data_field_1_tab_2_box", ["language"], :name => "language"
  add_index "field_data_field_1_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_1_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_3_box_value",  :limit => 2147483647
    t.string  "field_1_tab_3_box_format"
  end

  add_index "field_data_field_1_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_1_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_1_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_1_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_1_tab_3_box", ["field_1_tab_3_box_format"], :name => "field_1_tab_3_box_format"
  add_index "field_data_field_1_tab_3_box", ["language"], :name => "language"
  add_index "field_data_field_1_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_1_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_4_box_value",  :limit => 2147483647
    t.string  "field_1_tab_4_box_format"
  end

  add_index "field_data_field_1_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_1_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_1_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_1_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_1_tab_4_box", ["field_1_tab_4_box_format"], :name => "field_1_tab_4_box_format"
  add_index "field_data_field_1_tab_4_box", ["language"], :name => "language"
  add_index "field_data_field_1_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_1_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_title_value",  :limit => 2147483647
    t.string  "field_1_tab_title_format"
  end

  add_index "field_data_field_1_tab_title", ["bundle"], :name => "bundle"
  add_index "field_data_field_1_tab_title", ["deleted"], :name => "deleted"
  add_index "field_data_field_1_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_1_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_1_tab_title", ["field_1_tab_title_format"], :name => "field_1_tab_title_format"
  add_index "field_data_field_1_tab_title", ["language"], :name => "language"
  add_index "field_data_field_1_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_2_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_1_box_value",  :limit => 2147483647
    t.string  "field_2_tab_1_box_format"
  end

  add_index "field_data_field_2_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_2_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_2_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_2_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_2_tab_1_box", ["field_2_tab_1_box_format"], :name => "field_2_tab_1_box_format"
  add_index "field_data_field_2_tab_1_box", ["language"], :name => "language"
  add_index "field_data_field_2_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_2_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_2_box_value",  :limit => 2147483647
    t.string  "field_2_tab_2_box_format"
  end

  add_index "field_data_field_2_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_2_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_2_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_2_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_2_tab_2_box", ["field_2_tab_2_box_format"], :name => "field_2_tab_2_box_format"
  add_index "field_data_field_2_tab_2_box", ["language"], :name => "language"
  add_index "field_data_field_2_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_2_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_3_box_value",  :limit => 2147483647
    t.string  "field_2_tab_3_box_format"
  end

  add_index "field_data_field_2_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_2_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_2_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_2_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_2_tab_3_box", ["field_2_tab_3_box_format"], :name => "field_2_tab_3_box_format"
  add_index "field_data_field_2_tab_3_box", ["language"], :name => "language"
  add_index "field_data_field_2_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_2_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_4_box_value",  :limit => 2147483647
    t.string  "field_2_tab_4_box_format"
  end

  add_index "field_data_field_2_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_2_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_2_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_2_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_2_tab_4_box", ["field_2_tab_4_box_format"], :name => "field_2_tab_4_box_format"
  add_index "field_data_field_2_tab_4_box", ["language"], :name => "language"
  add_index "field_data_field_2_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_2_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_title_value",  :limit => 2147483647
    t.string  "field_2_tab_title_format"
  end

  add_index "field_data_field_2_tab_title", ["bundle"], :name => "bundle"
  add_index "field_data_field_2_tab_title", ["deleted"], :name => "deleted"
  add_index "field_data_field_2_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_2_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_2_tab_title", ["field_2_tab_title_format"], :name => "field_2_tab_title_format"
  add_index "field_data_field_2_tab_title", ["language"], :name => "language"
  add_index "field_data_field_2_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_3_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_1_box_value",  :limit => 2147483647
    t.string  "field_3_tab_1_box_format"
  end

  add_index "field_data_field_3_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_3_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_3_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_3_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_3_tab_1_box", ["field_3_tab_1_box_format"], :name => "field_3_tab_1_box_format"
  add_index "field_data_field_3_tab_1_box", ["language"], :name => "language"
  add_index "field_data_field_3_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_3_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_2_box_value",  :limit => 2147483647
    t.string  "field_3_tab_2_box_format"
  end

  add_index "field_data_field_3_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_3_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_3_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_3_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_3_tab_2_box", ["field_3_tab_2_box_format"], :name => "field_3_tab_2_box_format"
  add_index "field_data_field_3_tab_2_box", ["language"], :name => "language"
  add_index "field_data_field_3_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_3_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_3_box_value",  :limit => 2147483647
    t.string  "field_3_tab_3_box_format"
  end

  add_index "field_data_field_3_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_3_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_3_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_3_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_3_tab_3_box", ["field_3_tab_3_box_format"], :name => "field_3_tab_3_box_format"
  add_index "field_data_field_3_tab_3_box", ["language"], :name => "language"
  add_index "field_data_field_3_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_3_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_4_box_value",  :limit => 2147483647
    t.string  "field_3_tab_4_box_format"
  end

  add_index "field_data_field_3_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_data_field_3_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_data_field_3_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_3_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_3_tab_4_box", ["field_3_tab_4_box_format"], :name => "field_3_tab_4_box_format"
  add_index "field_data_field_3_tab_4_box", ["language"], :name => "language"
  add_index "field_data_field_3_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_3_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_title_value",  :limit => 2147483647
    t.string  "field_3_tab_title_format"
  end

  add_index "field_data_field_3_tab_title", ["bundle"], :name => "bundle"
  add_index "field_data_field_3_tab_title", ["deleted"], :name => "deleted"
  add_index "field_data_field_3_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_3_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_3_tab_title", ["field_3_tab_title_format"], :name => "field_3_tab_title_format"
  add_index "field_data_field_3_tab_title", ["language"], :name => "language"
  add_index "field_data_field_3_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_background", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128,  :default => "", :null => false
    t.string  "bundle",                  :limit => 128,  :default => "", :null => false
    t.integer "deleted",                 :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id"
    t.string  "language",                :limit => 32,   :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.integer "field_background_fid"
    t.string  "field_background_alt",    :limit => 512
    t.string  "field_background_title",  :limit => 1024
    t.integer "field_background_width"
    t.integer "field_background_height"
  end

  add_index "field_data_field_background", ["bundle"], :name => "bundle"
  add_index "field_data_field_background", ["deleted"], :name => "deleted"
  add_index "field_data_field_background", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_background", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_background", ["field_background_fid"], :name => "field_background_fid"
  add_index "field_data_field_background", ["language"], :name => "language"
  add_index "field_data_field_background", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_button_text", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128, :default => "", :null => false
    t.string  "bundle",                   :limit => 128, :default => "", :null => false
    t.integer "deleted",                  :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.string  "field_button_text_value"
    t.string  "field_button_text_format"
  end

  add_index "field_data_field_button_text", ["bundle"], :name => "bundle"
  add_index "field_data_field_button_text", ["deleted"], :name => "deleted"
  add_index "field_data_field_button_text", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_button_text", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_button_text", ["field_button_text_format"], :name => "field_button_text_format"
  add_index "field_data_field_button_text", ["language"], :name => "language"
  add_index "field_data_field_button_text", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_category", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128, :default => "", :null => false
    t.string  "bundle",             :limit => 128, :default => "", :null => false
    t.integer "deleted",            :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                         :null => false
    t.integer "revision_id"
    t.string  "language",           :limit => 32,  :default => "", :null => false
    t.integer "delta",                                             :null => false
    t.integer "field_category_tid"
  end

  add_index "field_data_field_category", ["bundle"], :name => "bundle"
  add_index "field_data_field_category", ["deleted"], :name => "deleted"
  add_index "field_data_field_category", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_category", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_category", ["field_category_tid"], :name => "field_category_tid"
  add_index "field_data_field_category", ["language"], :name => "language"
  add_index "field_data_field_category", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_city", :id => false, :force => true do |t|
    t.string  "entity_type",    :limit => 128, :default => "", :null => false
    t.string  "bundle",         :limit => 128, :default => "", :null => false
    t.integer "deleted",        :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                     :null => false
    t.integer "revision_id"
    t.string  "language",       :limit => 32,  :default => "", :null => false
    t.integer "delta",                                         :null => false
    t.integer "field_city_tid"
  end

  add_index "field_data_field_city", ["bundle"], :name => "bundle"
  add_index "field_data_field_city", ["deleted"], :name => "deleted"
  add_index "field_data_field_city", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_city", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_city", ["field_city_tid"], :name => "field_city_tid"
  add_index "field_data_field_city", ["language"], :name => "language"
  add_index "field_data_field_city", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_first_name", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128, :default => "", :null => false
    t.string  "bundle",                  :limit => 128, :default => "", :null => false
    t.integer "deleted",                 :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                              :null => false
    t.integer "revision_id"
    t.string  "language",                :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                  :null => false
    t.string  "field_first_name_value"
    t.string  "field_first_name_format"
  end

  add_index "field_data_field_first_name", ["bundle"], :name => "bundle"
  add_index "field_data_field_first_name", ["deleted"], :name => "deleted"
  add_index "field_data_field_first_name", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_first_name", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_first_name", ["field_first_name_format"], :name => "field_first_name_format"
  add_index "field_data_field_first_name", ["language"], :name => "language"
  add_index "field_data_field_first_name", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_gallery", :id => false, :force => true do |t|
    t.string  "entity_type",          :limit => 128,  :default => "", :null => false
    t.string  "bundle",               :limit => 128,  :default => "", :null => false
    t.integer "deleted",              :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                            :null => false
    t.integer "revision_id"
    t.string  "language",             :limit => 32,   :default => "", :null => false
    t.integer "delta",                                                :null => false
    t.integer "field_gallery_fid"
    t.string  "field_gallery_alt",    :limit => 512
    t.string  "field_gallery_title",  :limit => 1024
    t.integer "field_gallery_width"
    t.integer "field_gallery_height"
  end

  add_index "field_data_field_gallery", ["bundle"], :name => "bundle"
  add_index "field_data_field_gallery", ["deleted"], :name => "deleted"
  add_index "field_data_field_gallery", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_gallery", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_gallery", ["field_gallery_fid"], :name => "field_gallery_fid"
  add_index "field_data_field_gallery", ["language"], :name => "language"
  add_index "field_data_field_gallery", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_image", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128,  :default => "", :null => false
    t.string  "bundle",             :limit => 128,  :default => "", :null => false
    t.integer "deleted",            :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                          :null => false
    t.integer "revision_id"
    t.string  "language",           :limit => 32,   :default => "", :null => false
    t.integer "delta",                                              :null => false
    t.integer "field_image_fid"
    t.string  "field_image_alt",    :limit => 512
    t.string  "field_image_title",  :limit => 1024
    t.integer "field_image_width"
    t.integer "field_image_height"
  end

  add_index "field_data_field_image", ["bundle"], :name => "bundle"
  add_index "field_data_field_image", ["deleted"], :name => "deleted"
  add_index "field_data_field_image", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_image", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_image", ["field_image_fid"], :name => "field_image_fid"
  add_index "field_data_field_image", ["language"], :name => "language"
  add_index "field_data_field_image", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_info", :id => false, :force => true do |t|
    t.string  "entity_type",       :limit => 128,        :default => "", :null => false
    t.string  "bundle",            :limit => 128,        :default => "", :null => false
    t.integer "deleted",           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id"
    t.string  "language",          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.text    "field_info_value",  :limit => 2147483647
    t.string  "field_info_format"
  end

  add_index "field_data_field_info", ["bundle"], :name => "bundle"
  add_index "field_data_field_info", ["deleted"], :name => "deleted"
  add_index "field_data_field_info", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_info", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_info", ["field_info_format"], :name => "field_info_format"
  add_index "field_data_field_info", ["language"], :name => "language"
  add_index "field_data_field_info", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_last_name", :id => false, :force => true do |t|
    t.string  "entity_type",            :limit => 128, :default => "", :null => false
    t.string  "bundle",                 :limit => 128, :default => "", :null => false
    t.integer "deleted",                :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                             :null => false
    t.integer "revision_id"
    t.string  "language",               :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                 :null => false
    t.string  "field_last_name_value"
    t.string  "field_last_name_format"
  end

  add_index "field_data_field_last_name", ["bundle"], :name => "bundle"
  add_index "field_data_field_last_name", ["deleted"], :name => "deleted"
  add_index "field_data_field_last_name", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_last_name", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_last_name", ["field_last_name_format"], :name => "field_last_name_format"
  add_index "field_data_field_last_name", ["language"], :name => "language"
  add_index "field_data_field_last_name", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_my_subscriptions", :id => false, :force => true do |t|
    t.string  "entity_type",                    :limit => 128,        :default => "", :null => false
    t.string  "bundle",                         :limit => 128,        :default => "", :null => false
    t.integer "deleted",                        :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                            :null => false
    t.integer "revision_id"
    t.string  "language",                       :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                :null => false
    t.text    "field_my_subscriptions_value",   :limit => 2147483647
    t.text    "field_my_subscriptions_summary", :limit => 2147483647
    t.string  "field_my_subscriptions_format"
  end

  add_index "field_data_field_my_subscriptions", ["bundle"], :name => "bundle"
  add_index "field_data_field_my_subscriptions", ["deleted"], :name => "deleted"
  add_index "field_data_field_my_subscriptions", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_my_subscriptions", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_my_subscriptions", ["field_my_subscriptions_format"], :name => "field_my_subscriptions_format"
  add_index "field_data_field_my_subscriptions", ["language"], :name => "language"
  add_index "field_data_field_my_subscriptions", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_personal_information", :id => false, :force => true do |t|
    t.string  "entity_type",                                        :limit => 128,        :default => "", :null => false
    t.string  "bundle",                                             :limit => 128,        :default => "", :null => false
    t.integer "deleted",                                            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                                :null => false
    t.integer "revision_id"
    t.string  "language",                                           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                                    :null => false
    t.string  "field_personal_information_country",                 :limit => 2,          :default => ""
    t.string  "field_personal_information_administrative_area",                           :default => ""
    t.string  "field_personal_information_sub_administrative_area",                       :default => ""
    t.string  "field_personal_information_locality",                                      :default => ""
    t.string  "field_personal_information_dependent_locality",                            :default => ""
    t.string  "field_personal_information_postal_code",                                   :default => ""
    t.string  "field_personal_information_thoroughfare",                                  :default => ""
    t.string  "field_personal_information_premise",                                       :default => ""
    t.string  "field_personal_information_sub_premise",                                   :default => ""
    t.string  "field_personal_information_organisation_name",                             :default => ""
    t.string  "field_personal_information_name_line",                                     :default => ""
    t.string  "field_personal_information_first_name",                                    :default => ""
    t.string  "field_personal_information_last_name",                                     :default => ""
    t.text    "field_personal_information_data",                    :limit => 2147483647
  end

  add_index "field_data_field_personal_information", ["bundle"], :name => "bundle"
  add_index "field_data_field_personal_information", ["deleted"], :name => "deleted"
  add_index "field_data_field_personal_information", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_personal_information", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_personal_information", ["language"], :name => "language"
  add_index "field_data_field_personal_information", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_price", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128,        :default => "", :null => false
    t.string  "bundle",             :limit => 128,        :default => "", :null => false
    t.integer "deleted",            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                :null => false
    t.integer "revision_id"
    t.string  "language",           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                    :null => false
    t.text    "field_price_value",  :limit => 2147483647
    t.string  "field_price_format"
  end

  add_index "field_data_field_price", ["bundle"], :name => "bundle"
  add_index "field_data_field_price", ["deleted"], :name => "deleted"
  add_index "field_data_field_price", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_price", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_price", ["field_price_format"], :name => "field_price_format"
  add_index "field_data_field_price", ["language"], :name => "language"
  add_index "field_data_field_price", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_product", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128, :default => "", :null => false
    t.string  "bundle",                   :limit => 128, :default => "", :null => false
    t.integer "deleted",                  :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id"
    t.string  "language",                 :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.integer "field_product_product_id"
  end

  add_index "field_data_field_product", ["bundle"], :name => "bundle"
  add_index "field_data_field_product", ["deleted"], :name => "deleted"
  add_index "field_data_field_product", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_product", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_product", ["field_product_product_id"], :name => "field_product_product_id"
  add_index "field_data_field_product", ["language"], :name => "language"
  add_index "field_data_field_product", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_purchase", :id => false, :force => true do |t|
    t.string  "entity_type",           :limit => 128,        :default => "", :null => false
    t.string  "bundle",                :limit => 128,        :default => "", :null => false
    t.integer "deleted",               :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                   :null => false
    t.integer "revision_id"
    t.string  "language",              :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                       :null => false
    t.text    "field_purchase_value",  :limit => 2147483647
    t.string  "field_purchase_format"
  end

  add_index "field_data_field_purchase", ["bundle"], :name => "bundle"
  add_index "field_data_field_purchase", ["deleted"], :name => "deleted"
  add_index "field_data_field_purchase", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_purchase", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_purchase", ["field_purchase_format"], :name => "field_purchase_format"
  add_index "field_data_field_purchase", ["language"], :name => "language"
  add_index "field_data_field_purchase", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_show_on_top", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128, :default => "", :null => false
    t.string  "bundle",                  :limit => 128, :default => "", :null => false
    t.integer "deleted",                 :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                              :null => false
    t.integer "revision_id"
    t.string  "language",                :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                  :null => false
    t.integer "field_show_on_top_value"
  end

  add_index "field_data_field_show_on_top", ["bundle"], :name => "bundle"
  add_index "field_data_field_show_on_top", ["deleted"], :name => "deleted"
  add_index "field_data_field_show_on_top", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_show_on_top", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_show_on_top", ["field_show_on_top_value"], :name => "field_show_on_top_value"
  add_index "field_data_field_show_on_top", ["language"], :name => "language"
  add_index "field_data_field_show_on_top", ["revision_id"], :name => "revision_id"

  create_table "field_data_field_zip_code", :id => false, :force => true do |t|
    t.string  "entity_type",           :limit => 128, :default => "", :null => false
    t.string  "bundle",                :limit => 128, :default => "", :null => false
    t.integer "deleted",               :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                            :null => false
    t.integer "revision_id"
    t.string  "language",              :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                :null => false
    t.string  "field_zip_code_value"
    t.string  "field_zip_code_format"
  end

  add_index "field_data_field_zip_code", ["bundle"], :name => "bundle"
  add_index "field_data_field_zip_code", ["deleted"], :name => "deleted"
  add_index "field_data_field_zip_code", ["entity_id"], :name => "entity_id"
  add_index "field_data_field_zip_code", ["entity_type"], :name => "entity_type"
  add_index "field_data_field_zip_code", ["field_zip_code_format"], :name => "field_zip_code_format"
  add_index "field_data_field_zip_code", ["language"], :name => "language"
  add_index "field_data_field_zip_code", ["revision_id"], :name => "revision_id"

  create_table "field_revision_body", :id => false, :force => true do |t|
    t.string  "entity_type",  :limit => 128,        :default => "", :null => false
    t.string  "bundle",       :limit => 128,        :default => "", :null => false
    t.integer "deleted",      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                          :null => false
    t.integer "revision_id",                                        :null => false
    t.string  "language",     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                              :null => false
    t.text    "body_value",   :limit => 2147483647
    t.text    "body_summary", :limit => 2147483647
    t.string  "body_format"
  end

  add_index "field_revision_body", ["body_format"], :name => "body_format"
  add_index "field_revision_body", ["bundle"], :name => "bundle"
  add_index "field_revision_body", ["deleted"], :name => "deleted"
  add_index "field_revision_body", ["entity_id"], :name => "entity_id"
  add_index "field_revision_body", ["entity_type"], :name => "entity_type"
  add_index "field_revision_body", ["language"], :name => "language"
  add_index "field_revision_body", ["revision_id"], :name => "revision_id"

  create_table "field_revision_comment_body", :id => false, :force => true do |t|
    t.string  "entity_type",         :limit => 128,        :default => "", :null => false
    t.string  "bundle",              :limit => 128,        :default => "", :null => false
    t.integer "deleted",             :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                 :null => false
    t.integer "revision_id",                                               :null => false
    t.string  "language",            :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                     :null => false
    t.text    "comment_body_value",  :limit => 2147483647
    t.string  "comment_body_format"
  end

  add_index "field_revision_comment_body", ["bundle"], :name => "bundle"
  add_index "field_revision_comment_body", ["comment_body_format"], :name => "comment_body_format"
  add_index "field_revision_comment_body", ["deleted"], :name => "deleted"
  add_index "field_revision_comment_body", ["entity_id"], :name => "entity_id"
  add_index "field_revision_comment_body", ["entity_type"], :name => "entity_type"
  add_index "field_revision_comment_body", ["language"], :name => "language"
  add_index "field_revision_comment_body", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_customer_address", :id => false, :force => true do |t|
    t.string  "entity_type",                                       :limit => 128,        :default => "", :null => false
    t.string  "bundle",                                            :limit => 128,        :default => "", :null => false
    t.integer "deleted",                                           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                               :null => false
    t.integer "revision_id",                                                                             :null => false
    t.string  "language",                                          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                                   :null => false
    t.string  "commerce_customer_address_country",                 :limit => 2,          :default => ""
    t.string  "commerce_customer_address_administrative_area",                           :default => ""
    t.string  "commerce_customer_address_sub_administrative_area",                       :default => ""
    t.string  "commerce_customer_address_locality",                                      :default => ""
    t.string  "commerce_customer_address_dependent_locality",                            :default => ""
    t.string  "commerce_customer_address_postal_code",                                   :default => ""
    t.string  "commerce_customer_address_thoroughfare",                                  :default => ""
    t.string  "commerce_customer_address_premise",                                       :default => ""
    t.string  "commerce_customer_address_sub_premise",                                   :default => ""
    t.string  "commerce_customer_address_organisation_name",                             :default => ""
    t.string  "commerce_customer_address_name_line",                                     :default => ""
    t.string  "commerce_customer_address_first_name",                                    :default => ""
    t.string  "commerce_customer_address_last_name",                                     :default => ""
    t.text    "commerce_customer_address_data",                    :limit => 2147483647
  end

  add_index "field_revision_commerce_customer_address", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_customer_address", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_customer_address", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_customer_address", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_customer_address", ["language"], :name => "language"
  add_index "field_revision_commerce_customer_address", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_customer_billing", :id => false, :force => true do |t|
    t.string  "entity_type",                          :limit => 128, :default => "", :null => false
    t.string  "bundle",                               :limit => 128, :default => "", :null => false
    t.integer "deleted",                              :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                           :null => false
    t.integer "revision_id",                                                         :null => false
    t.string  "language",                             :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                               :null => false
    t.integer "commerce_customer_billing_profile_id"
  end

  add_index "field_revision_commerce_customer_billing", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_customer_billing", ["commerce_customer_billing_profile_id"], :name => "commerce_customer_billing_profile_id"
  add_index "field_revision_commerce_customer_billing", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_customer_billing", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_customer_billing", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_customer_billing", ["language"], :name => "language"
  add_index "field_revision_commerce_customer_billing", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_display_path", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128, :default => "", :null => false
    t.string  "bundle",                       :limit => 128, :default => "", :null => false
    t.integer "deleted",                      :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                   :null => false
    t.integer "revision_id",                                                 :null => false
    t.string  "language",                     :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                       :null => false
    t.string  "commerce_display_path_value"
    t.string  "commerce_display_path_format"
  end

  add_index "field_revision_commerce_display_path", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_display_path", ["commerce_display_path_format"], :name => "commerce_display_path_format"
  add_index "field_revision_commerce_display_path", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_display_path", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_display_path", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_display_path", ["language"], :name => "language"
  add_index "field_revision_commerce_display_path", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_line_items", :id => false, :force => true do |t|
    t.string  "entity_type",                      :limit => 128, :default => "", :null => false
    t.string  "bundle",                           :limit => 128, :default => "", :null => false
    t.integer "deleted",                          :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                       :null => false
    t.integer "revision_id",                                                     :null => false
    t.string  "language",                         :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                           :null => false
    t.integer "commerce_line_items_line_item_id"
  end

  add_index "field_revision_commerce_line_items", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_line_items", ["commerce_line_items_line_item_id"], :name => "commerce_line_items_line_item_id"
  add_index "field_revision_commerce_line_items", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_line_items", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_line_items", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_line_items", ["language"], :name => "language"
  add_index "field_revision_commerce_line_items", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_order_total", :id => false, :force => true do |t|
    t.string  "entity_type",                        :limit => 128,        :default => "", :null => false
    t.string  "bundle",                             :limit => 128,        :default => "", :null => false
    t.integer "deleted",                            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                :null => false
    t.integer "revision_id",                                                              :null => false
    t.string  "language",                           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                    :null => false
    t.integer "commerce_order_total_amount",                              :default => 0,  :null => false
    t.string  "commerce_order_total_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_order_total_data",          :limit => 2147483647
  end

  add_index "field_revision_commerce_order_total", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_order_total", ["commerce_order_total_amount", "commerce_order_total_currency_code"], :name => "commerce_order_total_currency_price"
  add_index "field_revision_commerce_order_total", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_order_total", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_order_total", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_order_total", ["language"], :name => "language"
  add_index "field_revision_commerce_order_total", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_price", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128,        :default => "", :null => false
    t.string  "bundle",                       :limit => 128,        :default => "", :null => false
    t.integer "deleted",                      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                          :null => false
    t.integer "revision_id",                                                        :null => false
    t.string  "language",                     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                              :null => false
    t.integer "commerce_price_amount",                              :default => 0,  :null => false
    t.string  "commerce_price_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_price_data",          :limit => 2147483647
  end

  add_index "field_revision_commerce_price", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_price", ["commerce_price_amount", "commerce_price_currency_code"], :name => "commerce_price_currency_price"
  add_index "field_revision_commerce_price", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_price", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_price", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_price", ["language"], :name => "language"
  add_index "field_revision_commerce_price", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_product", :id => false, :force => true do |t|
    t.string  "entity_type",                 :limit => 128, :default => "", :null => false
    t.string  "bundle",                      :limit => 128, :default => "", :null => false
    t.integer "deleted",                     :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                                  :null => false
    t.integer "revision_id",                                                :null => false
    t.string  "language",                    :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                      :null => false
    t.integer "commerce_product_product_id"
  end

  add_index "field_revision_commerce_product", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_product", ["commerce_product_product_id"], :name => "commerce_product_product_id"
  add_index "field_revision_commerce_product", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_product", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_product", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_product", ["language"], :name => "language"
  add_index "field_revision_commerce_product", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_total", :id => false, :force => true do |t|
    t.string  "entity_type",                  :limit => 128,        :default => "", :null => false
    t.string  "bundle",                       :limit => 128,        :default => "", :null => false
    t.integer "deleted",                      :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                          :null => false
    t.integer "revision_id",                                                        :null => false
    t.string  "language",                     :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                              :null => false
    t.integer "commerce_total_amount",                              :default => 0,  :null => false
    t.string  "commerce_total_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_total_data",          :limit => 2147483647
  end

  add_index "field_revision_commerce_total", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_total", ["commerce_total_amount", "commerce_total_currency_code"], :name => "commerce_total_currency_price"
  add_index "field_revision_commerce_total", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_total", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_total", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_total", ["language"], :name => "language"
  add_index "field_revision_commerce_total", ["revision_id"], :name => "revision_id"

  create_table "field_revision_commerce_unit_price", :id => false, :force => true do |t|
    t.string  "entity_type",                       :limit => 128,        :default => "", :null => false
    t.string  "bundle",                            :limit => 128,        :default => "", :null => false
    t.integer "deleted",                           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                               :null => false
    t.integer "revision_id",                                                             :null => false
    t.string  "language",                          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                   :null => false
    t.integer "commerce_unit_price_amount",                              :default => 0,  :null => false
    t.string  "commerce_unit_price_currency_code", :limit => 32,                         :null => false
    t.text    "commerce_unit_price_data",          :limit => 2147483647
  end

  add_index "field_revision_commerce_unit_price", ["bundle"], :name => "bundle"
  add_index "field_revision_commerce_unit_price", ["commerce_unit_price_amount", "commerce_unit_price_currency_code"], :name => "commerce_unit_price_currency_price"
  add_index "field_revision_commerce_unit_price", ["deleted"], :name => "deleted"
  add_index "field_revision_commerce_unit_price", ["entity_id"], :name => "entity_id"
  add_index "field_revision_commerce_unit_price", ["entity_type"], :name => "entity_type"
  add_index "field_revision_commerce_unit_price", ["language"], :name => "language"
  add_index "field_revision_commerce_unit_price", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_1_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_1_box_value",  :limit => 2147483647
    t.string  "field_1_tab_1_box_format"
  end

  add_index "field_revision_field_1_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_1_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_1_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_1_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_1_tab_1_box", ["field_1_tab_1_box_format"], :name => "field_1_tab_1_box_format"
  add_index "field_revision_field_1_tab_1_box", ["language"], :name => "language"
  add_index "field_revision_field_1_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_1_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_2_box_value",  :limit => 2147483647
    t.string  "field_1_tab_2_box_format"
  end

  add_index "field_revision_field_1_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_1_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_1_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_1_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_1_tab_2_box", ["field_1_tab_2_box_format"], :name => "field_1_tab_2_box_format"
  add_index "field_revision_field_1_tab_2_box", ["language"], :name => "language"
  add_index "field_revision_field_1_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_1_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_3_box_value",  :limit => 2147483647
    t.string  "field_1_tab_3_box_format"
  end

  add_index "field_revision_field_1_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_1_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_1_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_1_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_1_tab_3_box", ["field_1_tab_3_box_format"], :name => "field_1_tab_3_box_format"
  add_index "field_revision_field_1_tab_3_box", ["language"], :name => "language"
  add_index "field_revision_field_1_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_1_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_4_box_value",  :limit => 2147483647
    t.string  "field_1_tab_4_box_format"
  end

  add_index "field_revision_field_1_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_1_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_1_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_1_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_1_tab_4_box", ["field_1_tab_4_box_format"], :name => "field_1_tab_4_box_format"
  add_index "field_revision_field_1_tab_4_box", ["language"], :name => "language"
  add_index "field_revision_field_1_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_1_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_1_tab_title_value",  :limit => 2147483647
    t.string  "field_1_tab_title_format"
  end

  add_index "field_revision_field_1_tab_title", ["bundle"], :name => "bundle"
  add_index "field_revision_field_1_tab_title", ["deleted"], :name => "deleted"
  add_index "field_revision_field_1_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_1_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_1_tab_title", ["field_1_tab_title_format"], :name => "field_1_tab_title_format"
  add_index "field_revision_field_1_tab_title", ["language"], :name => "language"
  add_index "field_revision_field_1_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_2_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_1_box_value",  :limit => 2147483647
    t.string  "field_2_tab_1_box_format"
  end

  add_index "field_revision_field_2_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_2_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_2_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_2_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_2_tab_1_box", ["field_2_tab_1_box_format"], :name => "field_2_tab_1_box_format"
  add_index "field_revision_field_2_tab_1_box", ["language"], :name => "language"
  add_index "field_revision_field_2_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_2_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_2_box_value",  :limit => 2147483647
    t.string  "field_2_tab_2_box_format"
  end

  add_index "field_revision_field_2_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_2_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_2_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_2_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_2_tab_2_box", ["field_2_tab_2_box_format"], :name => "field_2_tab_2_box_format"
  add_index "field_revision_field_2_tab_2_box", ["language"], :name => "language"
  add_index "field_revision_field_2_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_2_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_3_box_value",  :limit => 2147483647
    t.string  "field_2_tab_3_box_format"
  end

  add_index "field_revision_field_2_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_2_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_2_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_2_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_2_tab_3_box", ["field_2_tab_3_box_format"], :name => "field_2_tab_3_box_format"
  add_index "field_revision_field_2_tab_3_box", ["language"], :name => "language"
  add_index "field_revision_field_2_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_2_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_4_box_value",  :limit => 2147483647
    t.string  "field_2_tab_4_box_format"
  end

  add_index "field_revision_field_2_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_2_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_2_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_2_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_2_tab_4_box", ["field_2_tab_4_box_format"], :name => "field_2_tab_4_box_format"
  add_index "field_revision_field_2_tab_4_box", ["language"], :name => "language"
  add_index "field_revision_field_2_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_2_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_2_tab_title_value",  :limit => 2147483647
    t.string  "field_2_tab_title_format"
  end

  add_index "field_revision_field_2_tab_title", ["bundle"], :name => "bundle"
  add_index "field_revision_field_2_tab_title", ["deleted"], :name => "deleted"
  add_index "field_revision_field_2_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_2_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_2_tab_title", ["field_2_tab_title_format"], :name => "field_2_tab_title_format"
  add_index "field_revision_field_2_tab_title", ["language"], :name => "language"
  add_index "field_revision_field_2_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_3_tab_1_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_1_box_value",  :limit => 2147483647
    t.string  "field_3_tab_1_box_format"
  end

  add_index "field_revision_field_3_tab_1_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_3_tab_1_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_3_tab_1_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_3_tab_1_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_3_tab_1_box", ["field_3_tab_1_box_format"], :name => "field_3_tab_1_box_format"
  add_index "field_revision_field_3_tab_1_box", ["language"], :name => "language"
  add_index "field_revision_field_3_tab_1_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_3_tab_2_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_2_box_value",  :limit => 2147483647
    t.string  "field_3_tab_2_box_format"
  end

  add_index "field_revision_field_3_tab_2_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_3_tab_2_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_3_tab_2_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_3_tab_2_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_3_tab_2_box", ["field_3_tab_2_box_format"], :name => "field_3_tab_2_box_format"
  add_index "field_revision_field_3_tab_2_box", ["language"], :name => "language"
  add_index "field_revision_field_3_tab_2_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_3_tab_3_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_3_box_value",  :limit => 2147483647
    t.string  "field_3_tab_3_box_format"
  end

  add_index "field_revision_field_3_tab_3_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_3_tab_3_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_3_tab_3_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_3_tab_3_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_3_tab_3_box", ["field_3_tab_3_box_format"], :name => "field_3_tab_3_box_format"
  add_index "field_revision_field_3_tab_3_box", ["language"], :name => "language"
  add_index "field_revision_field_3_tab_3_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_3_tab_4_box", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_4_box_value",  :limit => 2147483647
    t.string  "field_3_tab_4_box_format"
  end

  add_index "field_revision_field_3_tab_4_box", ["bundle"], :name => "bundle"
  add_index "field_revision_field_3_tab_4_box", ["deleted"], :name => "deleted"
  add_index "field_revision_field_3_tab_4_box", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_3_tab_4_box", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_3_tab_4_box", ["field_3_tab_4_box_format"], :name => "field_3_tab_4_box_format"
  add_index "field_revision_field_3_tab_4_box", ["language"], :name => "language"
  add_index "field_revision_field_3_tab_4_box", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_3_tab_title", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128,        :default => "", :null => false
    t.string  "bundle",                   :limit => 128,        :default => "", :null => false
    t.integer "deleted",                  :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                      :null => false
    t.integer "revision_id",                                                    :null => false
    t.string  "language",                 :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                          :null => false
    t.text    "field_3_tab_title_value",  :limit => 2147483647
    t.string  "field_3_tab_title_format"
  end

  add_index "field_revision_field_3_tab_title", ["bundle"], :name => "bundle"
  add_index "field_revision_field_3_tab_title", ["deleted"], :name => "deleted"
  add_index "field_revision_field_3_tab_title", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_3_tab_title", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_3_tab_title", ["field_3_tab_title_format"], :name => "field_3_tab_title_format"
  add_index "field_revision_field_3_tab_title", ["language"], :name => "language"
  add_index "field_revision_field_3_tab_title", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_background", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128,  :default => "", :null => false
    t.string  "bundle",                  :limit => 128,  :default => "", :null => false
    t.integer "deleted",                 :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id",                                             :null => false
    t.string  "language",                :limit => 32,   :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.integer "field_background_fid"
    t.string  "field_background_alt",    :limit => 512
    t.string  "field_background_title",  :limit => 1024
    t.integer "field_background_width"
    t.integer "field_background_height"
  end

  add_index "field_revision_field_background", ["bundle"], :name => "bundle"
  add_index "field_revision_field_background", ["deleted"], :name => "deleted"
  add_index "field_revision_field_background", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_background", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_background", ["field_background_fid"], :name => "field_background_fid"
  add_index "field_revision_field_background", ["language"], :name => "language"
  add_index "field_revision_field_background", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_button_text", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128, :default => "", :null => false
    t.string  "bundle",                   :limit => 128, :default => "", :null => false
    t.integer "deleted",                  :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id",                                             :null => false
    t.string  "language",                 :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.string  "field_button_text_value"
    t.string  "field_button_text_format"
  end

  add_index "field_revision_field_button_text", ["bundle"], :name => "bundle"
  add_index "field_revision_field_button_text", ["deleted"], :name => "deleted"
  add_index "field_revision_field_button_text", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_button_text", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_button_text", ["field_button_text_format"], :name => "field_button_text_format"
  add_index "field_revision_field_button_text", ["language"], :name => "language"
  add_index "field_revision_field_button_text", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_category", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128, :default => "", :null => false
    t.string  "bundle",             :limit => 128, :default => "", :null => false
    t.integer "deleted",            :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                         :null => false
    t.integer "revision_id",                                       :null => false
    t.string  "language",           :limit => 32,  :default => "", :null => false
    t.integer "delta",                                             :null => false
    t.integer "field_category_tid"
  end

  add_index "field_revision_field_category", ["bundle"], :name => "bundle"
  add_index "field_revision_field_category", ["deleted"], :name => "deleted"
  add_index "field_revision_field_category", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_category", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_category", ["field_category_tid"], :name => "field_category_tid"
  add_index "field_revision_field_category", ["language"], :name => "language"
  add_index "field_revision_field_category", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_city", :id => false, :force => true do |t|
    t.string  "entity_type",    :limit => 128, :default => "", :null => false
    t.string  "bundle",         :limit => 128, :default => "", :null => false
    t.integer "deleted",        :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                     :null => false
    t.integer "revision_id",                                   :null => false
    t.string  "language",       :limit => 32,  :default => "", :null => false
    t.integer "delta",                                         :null => false
    t.integer "field_city_tid"
  end

  add_index "field_revision_field_city", ["bundle"], :name => "bundle"
  add_index "field_revision_field_city", ["deleted"], :name => "deleted"
  add_index "field_revision_field_city", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_city", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_city", ["field_city_tid"], :name => "field_city_tid"
  add_index "field_revision_field_city", ["language"], :name => "language"
  add_index "field_revision_field_city", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_first_name", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128, :default => "", :null => false
    t.string  "bundle",                  :limit => 128, :default => "", :null => false
    t.integer "deleted",                 :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                              :null => false
    t.integer "revision_id",                                            :null => false
    t.string  "language",                :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                  :null => false
    t.string  "field_first_name_value"
    t.string  "field_first_name_format"
  end

  add_index "field_revision_field_first_name", ["bundle"], :name => "bundle"
  add_index "field_revision_field_first_name", ["deleted"], :name => "deleted"
  add_index "field_revision_field_first_name", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_first_name", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_first_name", ["field_first_name_format"], :name => "field_first_name_format"
  add_index "field_revision_field_first_name", ["language"], :name => "language"
  add_index "field_revision_field_first_name", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_gallery", :id => false, :force => true do |t|
    t.string  "entity_type",          :limit => 128,  :default => "", :null => false
    t.string  "bundle",               :limit => 128,  :default => "", :null => false
    t.integer "deleted",              :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                            :null => false
    t.integer "revision_id",                                          :null => false
    t.string  "language",             :limit => 32,   :default => "", :null => false
    t.integer "delta",                                                :null => false
    t.integer "field_gallery_fid"
    t.string  "field_gallery_alt",    :limit => 512
    t.string  "field_gallery_title",  :limit => 1024
    t.integer "field_gallery_width"
    t.integer "field_gallery_height"
  end

  add_index "field_revision_field_gallery", ["bundle"], :name => "bundle"
  add_index "field_revision_field_gallery", ["deleted"], :name => "deleted"
  add_index "field_revision_field_gallery", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_gallery", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_gallery", ["field_gallery_fid"], :name => "field_gallery_fid"
  add_index "field_revision_field_gallery", ["language"], :name => "language"
  add_index "field_revision_field_gallery", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_image", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128,  :default => "", :null => false
    t.string  "bundle",             :limit => 128,  :default => "", :null => false
    t.integer "deleted",            :limit => 1,    :default => 0,  :null => false
    t.integer "entity_id",                                          :null => false
    t.integer "revision_id",                                        :null => false
    t.string  "language",           :limit => 32,   :default => "", :null => false
    t.integer "delta",                                              :null => false
    t.integer "field_image_fid"
    t.string  "field_image_alt",    :limit => 512
    t.string  "field_image_title",  :limit => 1024
    t.integer "field_image_width"
    t.integer "field_image_height"
  end

  add_index "field_revision_field_image", ["bundle"], :name => "bundle"
  add_index "field_revision_field_image", ["deleted"], :name => "deleted"
  add_index "field_revision_field_image", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_image", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_image", ["field_image_fid"], :name => "field_image_fid"
  add_index "field_revision_field_image", ["language"], :name => "language"
  add_index "field_revision_field_image", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_info", :id => false, :force => true do |t|
    t.string  "entity_type",       :limit => 128,        :default => "", :null => false
    t.string  "bundle",            :limit => 128,        :default => "", :null => false
    t.integer "deleted",           :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id",                                             :null => false
    t.string  "language",          :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.text    "field_info_value",  :limit => 2147483647
    t.string  "field_info_format"
  end

  add_index "field_revision_field_info", ["bundle"], :name => "bundle"
  add_index "field_revision_field_info", ["deleted"], :name => "deleted"
  add_index "field_revision_field_info", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_info", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_info", ["field_info_format"], :name => "field_info_format"
  add_index "field_revision_field_info", ["language"], :name => "language"
  add_index "field_revision_field_info", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_last_name", :id => false, :force => true do |t|
    t.string  "entity_type",            :limit => 128, :default => "", :null => false
    t.string  "bundle",                 :limit => 128, :default => "", :null => false
    t.integer "deleted",                :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                             :null => false
    t.integer "revision_id",                                           :null => false
    t.string  "language",               :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                 :null => false
    t.string  "field_last_name_value"
    t.string  "field_last_name_format"
  end

  add_index "field_revision_field_last_name", ["bundle"], :name => "bundle"
  add_index "field_revision_field_last_name", ["deleted"], :name => "deleted"
  add_index "field_revision_field_last_name", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_last_name", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_last_name", ["field_last_name_format"], :name => "field_last_name_format"
  add_index "field_revision_field_last_name", ["language"], :name => "language"
  add_index "field_revision_field_last_name", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_my_subscriptions", :id => false, :force => true do |t|
    t.string  "entity_type",                    :limit => 128,        :default => "", :null => false
    t.string  "bundle",                         :limit => 128,        :default => "", :null => false
    t.integer "deleted",                        :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                            :null => false
    t.integer "revision_id",                                                          :null => false
    t.string  "language",                       :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                :null => false
    t.text    "field_my_subscriptions_value",   :limit => 2147483647
    t.text    "field_my_subscriptions_summary", :limit => 2147483647
    t.string  "field_my_subscriptions_format"
  end

  add_index "field_revision_field_my_subscriptions", ["bundle"], :name => "bundle"
  add_index "field_revision_field_my_subscriptions", ["deleted"], :name => "deleted"
  add_index "field_revision_field_my_subscriptions", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_my_subscriptions", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_my_subscriptions", ["field_my_subscriptions_format"], :name => "field_my_subscriptions_format"
  add_index "field_revision_field_my_subscriptions", ["language"], :name => "language"
  add_index "field_revision_field_my_subscriptions", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_personal_information", :id => false, :force => true do |t|
    t.string  "entity_type",                                        :limit => 128,        :default => "", :null => false
    t.string  "bundle",                                             :limit => 128,        :default => "", :null => false
    t.integer "deleted",                                            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                                                :null => false
    t.integer "revision_id",                                                                              :null => false
    t.string  "language",                                           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                                                    :null => false
    t.string  "field_personal_information_country",                 :limit => 2,          :default => ""
    t.string  "field_personal_information_administrative_area",                           :default => ""
    t.string  "field_personal_information_sub_administrative_area",                       :default => ""
    t.string  "field_personal_information_locality",                                      :default => ""
    t.string  "field_personal_information_dependent_locality",                            :default => ""
    t.string  "field_personal_information_postal_code",                                   :default => ""
    t.string  "field_personal_information_thoroughfare",                                  :default => ""
    t.string  "field_personal_information_premise",                                       :default => ""
    t.string  "field_personal_information_sub_premise",                                   :default => ""
    t.string  "field_personal_information_organisation_name",                             :default => ""
    t.string  "field_personal_information_name_line",                                     :default => ""
    t.string  "field_personal_information_first_name",                                    :default => ""
    t.string  "field_personal_information_last_name",                                     :default => ""
    t.text    "field_personal_information_data",                    :limit => 2147483647
  end

  add_index "field_revision_field_personal_information", ["bundle"], :name => "bundle"
  add_index "field_revision_field_personal_information", ["deleted"], :name => "deleted"
  add_index "field_revision_field_personal_information", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_personal_information", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_personal_information", ["language"], :name => "language"
  add_index "field_revision_field_personal_information", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_price", :id => false, :force => true do |t|
    t.string  "entity_type",        :limit => 128,        :default => "", :null => false
    t.string  "bundle",             :limit => 128,        :default => "", :null => false
    t.integer "deleted",            :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                :null => false
    t.integer "revision_id",                                              :null => false
    t.string  "language",           :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                    :null => false
    t.text    "field_price_value",  :limit => 2147483647
    t.string  "field_price_format"
  end

  add_index "field_revision_field_price", ["bundle"], :name => "bundle"
  add_index "field_revision_field_price", ["deleted"], :name => "deleted"
  add_index "field_revision_field_price", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_price", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_price", ["field_price_format"], :name => "field_price_format"
  add_index "field_revision_field_price", ["language"], :name => "language"
  add_index "field_revision_field_price", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_product", :id => false, :force => true do |t|
    t.string  "entity_type",              :limit => 128, :default => "", :null => false
    t.string  "bundle",                   :limit => 128, :default => "", :null => false
    t.integer "deleted",                  :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                               :null => false
    t.integer "revision_id",                                             :null => false
    t.string  "language",                 :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                   :null => false
    t.integer "field_product_product_id"
  end

  add_index "field_revision_field_product", ["bundle"], :name => "bundle"
  add_index "field_revision_field_product", ["deleted"], :name => "deleted"
  add_index "field_revision_field_product", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_product", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_product", ["field_product_product_id"], :name => "field_product_product_id"
  add_index "field_revision_field_product", ["language"], :name => "language"
  add_index "field_revision_field_product", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_purchase", :id => false, :force => true do |t|
    t.string  "entity_type",           :limit => 128,        :default => "", :null => false
    t.string  "bundle",                :limit => 128,        :default => "", :null => false
    t.integer "deleted",               :limit => 1,          :default => 0,  :null => false
    t.integer "entity_id",                                                   :null => false
    t.integer "revision_id",                                                 :null => false
    t.string  "language",              :limit => 32,         :default => "", :null => false
    t.integer "delta",                                                       :null => false
    t.text    "field_purchase_value",  :limit => 2147483647
    t.string  "field_purchase_format"
  end

  add_index "field_revision_field_purchase", ["bundle"], :name => "bundle"
  add_index "field_revision_field_purchase", ["deleted"], :name => "deleted"
  add_index "field_revision_field_purchase", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_purchase", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_purchase", ["field_purchase_format"], :name => "field_purchase_format"
  add_index "field_revision_field_purchase", ["language"], :name => "language"
  add_index "field_revision_field_purchase", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_show_on_top", :id => false, :force => true do |t|
    t.string  "entity_type",             :limit => 128, :default => "", :null => false
    t.string  "bundle",                  :limit => 128, :default => "", :null => false
    t.integer "deleted",                 :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                              :null => false
    t.integer "revision_id",                                            :null => false
    t.string  "language",                :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                  :null => false
    t.integer "field_show_on_top_value"
  end

  add_index "field_revision_field_show_on_top", ["bundle"], :name => "bundle"
  add_index "field_revision_field_show_on_top", ["deleted"], :name => "deleted"
  add_index "field_revision_field_show_on_top", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_show_on_top", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_show_on_top", ["field_show_on_top_value"], :name => "field_show_on_top_value"
  add_index "field_revision_field_show_on_top", ["language"], :name => "language"
  add_index "field_revision_field_show_on_top", ["revision_id"], :name => "revision_id"

  create_table "field_revision_field_zip_code", :id => false, :force => true do |t|
    t.string  "entity_type",           :limit => 128, :default => "", :null => false
    t.string  "bundle",                :limit => 128, :default => "", :null => false
    t.integer "deleted",               :limit => 1,   :default => 0,  :null => false
    t.integer "entity_id",                                            :null => false
    t.integer "revision_id",                                          :null => false
    t.string  "language",              :limit => 32,  :default => "", :null => false
    t.integer "delta",                                                :null => false
    t.string  "field_zip_code_value"
    t.string  "field_zip_code_format"
  end

  add_index "field_revision_field_zip_code", ["bundle"], :name => "bundle"
  add_index "field_revision_field_zip_code", ["deleted"], :name => "deleted"
  add_index "field_revision_field_zip_code", ["entity_id"], :name => "entity_id"
  add_index "field_revision_field_zip_code", ["entity_type"], :name => "entity_type"
  add_index "field_revision_field_zip_code", ["field_zip_code_format"], :name => "field_zip_code_format"
  add_index "field_revision_field_zip_code", ["language"], :name => "language"
  add_index "field_revision_field_zip_code", ["revision_id"], :name => "revision_id"

  create_table "file_managed", :primary_key => "fid", :force => true do |t|
    t.integer "uid",                    :default => 0,  :null => false
    t.string  "filename",               :default => "", :null => false
    t.string  "uri",                    :default => "", :null => false
    t.string  "filemime",               :default => "", :null => false
    t.integer "filesize",               :default => 0,  :null => false
    t.integer "status",    :limit => 1, :default => 0,  :null => false
    t.integer "timestamp",              :default => 0,  :null => false
  end

  add_index "file_managed", ["status"], :name => "status"
  add_index "file_managed", ["timestamp"], :name => "timestamp"
  add_index "file_managed", ["uid"], :name => "uid"
  add_index "file_managed", ["uri"], :name => "uri", :unique => true

  create_table "file_usage", :id => false, :force => true do |t|
    t.integer "fid",                                  :null => false
    t.string  "module",               :default => "", :null => false
    t.string  "type",   :limit => 64, :default => "", :null => false
    t.integer "id",                   :default => 0,  :null => false
    t.integer "count",                :default => 0,  :null => false
  end

  add_index "file_usage", ["fid", "count"], :name => "fid_count"
  add_index "file_usage", ["fid", "module"], :name => "fid_module"
  add_index "file_usage", ["type", "id"], :name => "type_id"

  create_table "filter", :id => false, :force => true do |t|
    t.string  "format",                                         :null => false
    t.string  "module",   :limit => 64,         :default => "", :null => false
    t.string  "name",     :limit => 32,         :default => "", :null => false
    t.integer "weight",                         :default => 0,  :null => false
    t.integer "status",                         :default => 0,  :null => false
    t.binary  "settings", :limit => 2147483647
  end

  add_index "filter", ["weight", "module", "name"], :name => "list"

  create_table "filter_format", :primary_key => "format", :force => true do |t|
    t.string  "name",                :default => "", :null => false
    t.integer "cache",  :limit => 1, :default => 0,  :null => false
    t.integer "status", :limit => 1, :default => 1,  :null => false
    t.integer "weight",              :default => 0,  :null => false
  end

  add_index "filter_format", ["name"], :name => "name", :unique => true
  add_index "filter_format", ["status", "weight"], :name => "status_weight"

  create_table "flood", :primary_key => "fid", :force => true do |t|
    t.string  "event",      :limit => 64,  :default => "", :null => false
    t.string  "identifier", :limit => 128, :default => "", :null => false
    t.integer "timestamp",                 :default => 0,  :null => false
    t.integer "expiration",                :default => 0,  :null => false
  end

  add_index "flood", ["event", "identifier", "timestamp"], :name => "allow"
  add_index "flood", ["expiration"], :name => "purge"

  create_table "history", :id => false, :force => true do |t|
    t.integer "uid",       :default => 0, :null => false
    t.integer "nid",       :default => 0, :null => false
    t.integer "timestamp", :default => 0, :null => false
  end

  add_index "history", ["nid"], :name => "nid"

  create_table "image_effects", :primary_key => "ieid", :force => true do |t|
    t.integer "isid",                         :default => 0, :null => false
    t.integer "weight",                       :default => 0, :null => false
    t.string  "name",                                        :null => false
    t.binary  "data",   :limit => 2147483647,                :null => false
  end

  add_index "image_effects", ["isid"], :name => "isid"
  add_index "image_effects", ["weight"], :name => "weight"

  create_table "image_styles", :primary_key => "isid", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "image_styles", ["name"], :name => "name", :unique => true

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "luxe_registries", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.date     "event_date"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "luxe_registries", ["event_id"], :name => "index_luxe_registries_on_event_id"

  create_table "menu_custom", :primary_key => "menu_name", :force => true do |t|
    t.string "title",       :default => "", :null => false
    t.text   "description"
  end

  create_table "menu_links", :primary_key => "mlid", :force => true do |t|
    t.string  "menu_name",    :limit => 32, :default => "",       :null => false
    t.integer "plid",                       :default => 0,        :null => false
    t.string  "link_path",                  :default => "",       :null => false
    t.string  "router_path",                :default => "",       :null => false
    t.string  "link_title",                 :default => "",       :null => false
    t.binary  "options"
    t.string  "module",                     :default => "system", :null => false
    t.integer "hidden",       :limit => 2,  :default => 0,        :null => false
    t.integer "external",     :limit => 2,  :default => 0,        :null => false
    t.integer "has_children", :limit => 2,  :default => 0,        :null => false
    t.integer "expanded",     :limit => 2,  :default => 0,        :null => false
    t.integer "weight",                     :default => 0,        :null => false
    t.integer "depth",        :limit => 2,  :default => 0,        :null => false
    t.integer "customized",   :limit => 2,  :default => 0,        :null => false
    t.integer "p1",                         :default => 0,        :null => false
    t.integer "p2",                         :default => 0,        :null => false
    t.integer "p3",                         :default => 0,        :null => false
    t.integer "p4",                         :default => 0,        :null => false
    t.integer "p5",                         :default => 0,        :null => false
    t.integer "p6",                         :default => 0,        :null => false
    t.integer "p7",                         :default => 0,        :null => false
    t.integer "p8",                         :default => 0,        :null => false
    t.integer "p9",                         :default => 0,        :null => false
    t.integer "updated",      :limit => 2,  :default => 0,        :null => false
  end

  add_index "menu_links", ["link_path", "menu_name"], :name => "path_menu", :length => {"link_path"=>128, "menu_name"=>nil}
  add_index "menu_links", ["menu_name", "p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9"], :name => "menu_parents"
  add_index "menu_links", ["menu_name", "plid", "expanded", "has_children"], :name => "menu_plid_expand_child"
  add_index "menu_links", ["router_path"], :name => "router_path", :length => {"router_path"=>128}

  create_table "menu_router", :primary_key => "path", :force => true do |t|
    t.binary  "load_functions",                                        :null => false
    t.binary  "to_arg_functions",                                      :null => false
    t.string  "access_callback",                       :default => "", :null => false
    t.binary  "access_arguments"
    t.string  "page_callback",                         :default => "", :null => false
    t.binary  "page_arguments"
    t.string  "delivery_callback",                     :default => "", :null => false
    t.integer "fit",                                   :default => 0,  :null => false
    t.integer "number_parts",      :limit => 2,        :default => 0,  :null => false
    t.integer "context",                               :default => 0,  :null => false
    t.string  "tab_parent",                            :default => "", :null => false
    t.string  "tab_root",                              :default => "", :null => false
    t.string  "title",                                 :default => "", :null => false
    t.string  "title_callback",                        :default => "", :null => false
    t.string  "title_arguments",                       :default => "", :null => false
    t.string  "theme_callback",                        :default => "", :null => false
    t.string  "theme_arguments",                       :default => "", :null => false
    t.integer "type",                                  :default => 0,  :null => false
    t.text    "description",                                           :null => false
    t.string  "position",                              :default => "", :null => false
    t.integer "weight",                                :default => 0,  :null => false
    t.text    "include_file",      :limit => 16777215
  end

  add_index "menu_router", ["fit"], :name => "fit"
  add_index "menu_router", ["tab_parent", "weight", "title"], :name => "tab_parent", :length => {"tab_parent"=>64, "weight"=>nil, "title"=>nil}
  add_index "menu_router", ["tab_root", "weight", "title"], :name => "tab_root_weight_title", :length => {"tab_root"=>64, "weight"=>nil, "title"=>nil}

  create_table "node", :primary_key => "nid", :force => true do |t|
    t.integer "vid"
    t.string  "type",      :limit => 32, :default => "", :null => false
    t.string  "language",  :limit => 12, :default => "", :null => false
    t.string  "title",                   :default => "", :null => false
    t.integer "uid",                     :default => 0,  :null => false
    t.integer "status",                  :default => 1,  :null => false
    t.integer "created",                 :default => 0,  :null => false
    t.integer "changed",                 :default => 0,  :null => false
    t.integer "comment",                 :default => 0,  :null => false
    t.integer "promote",                 :default => 0,  :null => false
    t.integer "sticky",                  :default => 0,  :null => false
    t.integer "tnid",                    :default => 0,  :null => false
    t.integer "translate",               :default => 0,  :null => false
  end

  add_index "node", ["changed"], :name => "node_changed"
  add_index "node", ["created"], :name => "node_created"
  add_index "node", ["promote", "status", "sticky", "created"], :name => "node_frontpage"
  add_index "node", ["status", "type", "nid"], :name => "node_status_type"
  add_index "node", ["title", "type"], :name => "node_title_type", :length => {"title"=>nil, "type"=>4}
  add_index "node", ["tnid"], :name => "tnid"
  add_index "node", ["translate"], :name => "translate"
  add_index "node", ["type"], :name => "node_type", :length => {"type"=>4}
  add_index "node", ["uid"], :name => "uid"
  add_index "node", ["vid"], :name => "vid", :unique => true

  create_table "node_access", :id => false, :force => true do |t|
    t.integer "nid",                       :default => 0,  :null => false
    t.integer "gid",                       :default => 0,  :null => false
    t.string  "realm",                     :default => "", :null => false
    t.integer "grant_view",   :limit => 1, :default => 0,  :null => false
    t.integer "grant_update", :limit => 1, :default => 0,  :null => false
    t.integer "grant_delete", :limit => 1, :default => 0,  :null => false
  end

  create_table "node_comment_statistics", :primary_key => "nid", :force => true do |t|
    t.integer "cid",                                  :default => 0, :null => false
    t.integer "last_comment_timestamp",               :default => 0, :null => false
    t.string  "last_comment_name",      :limit => 60
    t.integer "last_comment_uid",                     :default => 0, :null => false
    t.integer "comment_count",                        :default => 0, :null => false
  end

  add_index "node_comment_statistics", ["comment_count"], :name => "comment_count"
  add_index "node_comment_statistics", ["last_comment_timestamp"], :name => "node_comment_timestamp"
  add_index "node_comment_statistics", ["last_comment_uid"], :name => "last_comment_uid"

  create_table "node_revision", :primary_key => "vid", :force => true do |t|
    t.integer "nid",                             :default => 0,  :null => false
    t.integer "uid",                             :default => 0,  :null => false
    t.string  "title",                           :default => "", :null => false
    t.text    "log",       :limit => 2147483647,                 :null => false
    t.integer "timestamp",                       :default => 0,  :null => false
    t.integer "status",                          :default => 1,  :null => false
    t.integer "comment",                         :default => 0,  :null => false
    t.integer "promote",                         :default => 0,  :null => false
    t.integer "sticky",                          :default => 0,  :null => false
  end

  add_index "node_revision", ["nid"], :name => "nid"
  add_index "node_revision", ["uid"], :name => "uid"

  create_table "node_type", :primary_key => "type", :force => true do |t|
    t.string  "name",                            :default => "", :null => false
    t.string  "base",                                            :null => false
    t.string  "module",                                          :null => false
    t.text    "description", :limit => 16777215,                 :null => false
    t.text    "help",        :limit => 16777215,                 :null => false
    t.integer "has_title",   :limit => 1,                        :null => false
    t.string  "title_label",                     :default => "", :null => false
    t.integer "custom",      :limit => 1,        :default => 0,  :null => false
    t.integer "modified",    :limit => 1,        :default => 0,  :null => false
    t.integer "locked",      :limit => 1,        :default => 0,  :null => false
    t.integer "disabled",    :limit => 1,        :default => 0,  :null => false
    t.string  "orig_type",                       :default => "", :null => false
  end

  create_table "offer_events", :force => true do |t|
    t.integer  "event_id"
    t.integer  "offer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "offer_events", ["event_id"], :name => "index_offer_events_on_event_id"
  add_index "offer_events", ["offer_id"], :name => "index_offer_events_on_offer_id"

  create_table "offers", :force => true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.text     "summary"
    t.text     "overview"
    t.string   "amount"
    t.text     "details"
    t.text     "location"
    t.text     "merchant"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "luxe_registry_id"
  end

  add_index "offers", ["event_id"], :name => "index_offers_on_event_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "balance_amount"
    t.string   "payment_option"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "method"
    t.string   "email"
    t.string   "token_key"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "payment", :primary_key => "pid", :force => true do |t|
    t.string  "context"
    t.binary  "context_data",          :limit => 2147483647
    t.string  "currency_code",         :limit => 3,          :default => "XXX", :null => false
    t.string  "description",                                                    :null => false
    t.binary  "description_arguments", :limit => 2147483647,                    :null => false
    t.string  "finish_callback",                                                :null => false
    t.integer "pmid",                                        :default => 0,     :null => false
    t.integer "psiid_first",                                 :default => 0,     :null => false
    t.integer "psiid_last",                                  :default => 0,     :null => false
    t.integer "uid",                                         :default => 0,     :null => false
  end

  add_index "payment", ["pid"], :name => "pid"

  create_table "payment_commerce", :primary_key => "pid", :force => true do |t|
    t.integer "transaction_id", :null => false
  end

  add_index "payment_commerce", ["pid", "transaction_id"], :name => "transaction_id", :unique => true

  create_table "payment_line_item", :id => false, :force => true do |t|
    t.float   "amount",                                                       :null => false
    t.float   "amount_total",                                                 :null => false
    t.string  "description",                                                  :null => false
    t.binary  "description_arguments", :limit => 2147483647
    t.string  "name",                                        :default => "",  :null => false
    t.integer "pid",                                         :default => 0,   :null => false
    t.integer "quantity",                                    :default => 1,   :null => false
    t.float   "tax_rate",                                    :default => 0.0, :null => false
  end

  add_index "payment_line_item", ["pid"], :name => "pid"

  create_table "payment_method", :primary_key => "pmid", :force => true do |t|
    t.string  "controller_class_name",                             :null => false
    t.integer "enabled",               :limit => 1, :default => 0, :null => false
    t.string  "module",                                            :null => false
    t.string  "name",                                              :null => false
    t.integer "status",                :limit => 1, :default => 1, :null => false
    t.string  "title_generic",                                     :null => false
    t.string  "title_specific",                                    :null => false
    t.integer "uid",                                :default => 0, :null => false
  end

  add_index "payment_method", ["pmid"], :name => "pmid", :unique => true

  create_table "payment_status_item", :primary_key => "psiid", :force => true do |t|
    t.string  "status",                 :null => false
    t.integer "created",                :null => false
    t.integer "pid",     :default => 0, :null => false
  end

  add_index "payment_status_item", ["pid"], :name => "pid"

  create_table "paymentmethodbasic", :primary_key => "pmid", :force => true do |t|
    t.text   "message",     :limit => 2147483647
    t.string "status",                            :null => false
    t.string "text_format",                       :null => false
  end

  add_index "paymentmethodbasic", ["pmid"], :name => "pmid", :unique => true

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_number"
    t.date     "exp_date"
    t.string   "security_code"
    t.string   "telephone"
    t.string   "email"
    t.string   "means_contact_telephone"
    t.string   "means_contact_email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "price"
    t.string   "transaction_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "queue", :primary_key => "item_id", :force => true do |t|
    t.string  "name",                          :default => "", :null => false
    t.binary  "data",    :limit => 2147483647
    t.integer "expire",                        :default => 0,  :null => false
    t.integer "created",                       :default => 0,  :null => false
  end

  add_index "queue", ["expire"], :name => "expire"
  add_index "queue", ["name", "created"], :name => "name_created"

  create_table "rdf_mapping", :id => false, :force => true do |t|
    t.string "type",    :limit => 128,        :null => false
    t.string "bundle",  :limit => 128,        :null => false
    t.binary "mapping", :limit => 2147483647
  end

  create_table "registrant_infos", :force => true do |t|
    t.integer  "luxe_registry_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "daytime_phone"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "registrants", :force => true do |t|
    t.integer  "luxe_registry_id"
    t.string   "password"
    t.string   "password_confirmation"
    t.date     "before_this_date"
    t.boolean  "regis_addr1"
    t.boolean  "regis_addr2"
    t.boolean  "co_regis_addr1"
    t.boolean  "co_regis_addr2"
    t.boolean  "receive_gifts"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "registry", :id => false, :force => true do |t|
    t.string  "name",                  :default => "", :null => false
    t.string  "type",     :limit => 9, :default => "", :null => false
    t.string  "filename",                              :null => false
    t.string  "module",                :default => "", :null => false
    t.integer "weight",                :default => 0,  :null => false
  end

  add_index "registry", ["type", "weight", "module"], :name => "hook"

  create_table "registry_file", :primary_key => "filename", :force => true do |t|
    t.string "hash", :limit => 64, :null => false
  end

  create_table "role", :primary_key => "rid", :force => true do |t|
    t.string  "name",   :limit => 64, :default => "", :null => false
    t.integer "weight",               :default => 0,  :null => false
  end

  add_index "role", ["name", "weight"], :name => "name_weight"
  add_index "role", ["name"], :name => "name", :unique => true

  create_table "role_permission", :id => false, :force => true do |t|
    t.integer "rid",                                       :null => false
    t.string  "permission", :limit => 128, :default => "", :null => false
    t.string  "module",                    :default => "", :null => false
  end

  add_index "role_permission", ["permission"], :name => "permission"

  create_table "rules_config", :force => true do |t|
    t.string  "name",           :limit => 64,                                  :null => false
    t.string  "label",                                :default => "unlabeled", :null => false
    t.string  "plugin",         :limit => 127,                                 :null => false
    t.integer "active",                               :default => 1,           :null => false
    t.integer "weight",         :limit => 1,          :default => 0,           :null => false
    t.integer "status",         :limit => 1,          :default => 1,           :null => false
    t.integer "dirty",          :limit => 1,          :default => 0,           :null => false
    t.string  "module"
    t.integer "access_exposed", :limit => 1,          :default => 0,           :null => false
    t.binary  "data",           :limit => 2147483647
  end

  add_index "rules_config", ["name"], :name => "name", :unique => true
  add_index "rules_config", ["plugin"], :name => "plugin"

  create_table "rules_dependencies", :id => false, :force => true do |t|
    t.integer "id",     :null => false
    t.string  "module", :null => false
  end

  add_index "rules_dependencies", ["module"], :name => "module"

  create_table "rules_tags", :id => false, :force => true do |t|
    t.integer "id",  :null => false
    t.string  "tag", :null => false
  end

  create_table "rules_trigger", :id => false, :force => true do |t|
    t.integer "id",                                   :null => false
    t.string  "event", :limit => 127, :default => "", :null => false
  end

  create_table "search_dataset", :id => false, :force => true do |t|
    t.integer "sid",                           :default => 0, :null => false
    t.string  "type",    :limit => 16,                        :null => false
    t.text    "data",    :limit => 2147483647,                :null => false
    t.integer "reindex",                       :default => 0, :null => false
  end

  create_table "search_index", :id => false, :force => true do |t|
    t.string  "word",  :limit => 50, :default => "", :null => false
    t.integer "sid",                 :default => 0,  :null => false
    t.string  "type",  :limit => 16,                 :null => false
    t.float   "score"
  end

  add_index "search_index", ["sid", "type"], :name => "sid_type"

  create_table "search_node_links", :id => false, :force => true do |t|
    t.integer "sid",                           :default => 0,  :null => false
    t.string  "type",    :limit => 16,         :default => "", :null => false
    t.integer "nid",                           :default => 0,  :null => false
    t.text    "caption", :limit => 2147483647
  end

  add_index "search_node_links", ["nid"], :name => "nid"

  create_table "search_total", :primary_key => "word", :force => true do |t|
    t.float "count"
  end

  create_table "semaphore", :primary_key => "name", :force => true do |t|
    t.string "value",  :default => "", :null => false
    t.float  "expire",                 :null => false
  end

  add_index "semaphore", ["expire"], :name => "expire"
  add_index "semaphore", ["value"], :name => "value"

  create_table "sequences", :primary_key => "value", :force => true do |t|
  end

  create_table "sessions", :id => false, :force => true do |t|
    t.integer "uid",                                             :null => false
    t.string  "sid",       :limit => 128,                        :null => false
    t.string  "ssid",      :limit => 128,        :default => "", :null => false
    t.string  "hostname",  :limit => 128,        :default => "", :null => false
    t.integer "timestamp",                       :default => 0,  :null => false
    t.integer "cache",                           :default => 0,  :null => false
    t.binary  "session",   :limit => 2147483647
  end

  add_index "sessions", ["ssid"], :name => "ssid"
  add_index "sessions", ["timestamp"], :name => "timestamp"
  add_index "sessions", ["uid"], :name => "uid"

  create_table "shortcut_set", :primary_key => "set_name", :force => true do |t|
    t.string "title", :default => "", :null => false
  end

  create_table "shortcut_set_users", :primary_key => "uid", :force => true do |t|
    t.string "set_name", :limit => 32, :default => "", :null => false
  end

  add_index "shortcut_set_users", ["set_name"], :name => "set_name"

  create_table "subscriptions", :force => true do |t|
    t.integer  "luxe_registry_id"
    t.integer  "user_id"
    t.boolean  "subscribe"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "subscriptions", ["luxe_registry_id"], :name => "index_subscriptions_on_luxe_registry_id"

  create_table "system", :primary_key => "filename", :force => true do |t|
    t.string  "name",                         :default => "", :null => false
    t.string  "type",           :limit => 12, :default => "", :null => false
    t.string  "owner",                        :default => "", :null => false
    t.integer "status",                       :default => 0,  :null => false
    t.integer "bootstrap",                    :default => 0,  :null => false
    t.integer "schema_version", :limit => 2,  :default => -1, :null => false
    t.integer "weight",                       :default => 0,  :null => false
    t.binary  "info"
  end

  add_index "system", ["status", "bootstrap", "type", "weight", "name"], :name => "system_list"
  add_index "system", ["type", "name"], :name => "type_name"

  create_table "taxonomy_index", :id => false, :force => true do |t|
    t.integer "nid",                  :default => 0, :null => false
    t.integer "tid",                  :default => 0, :null => false
    t.integer "sticky",  :limit => 1, :default => 0
    t.integer "created",              :default => 0, :null => false
  end

  add_index "taxonomy_index", ["nid"], :name => "nid"
  add_index "taxonomy_index", ["tid", "sticky", "created"], :name => "term_node"

  create_table "taxonomy_term_data", :primary_key => "tid", :force => true do |t|
    t.integer "vid",                               :default => 0,  :null => false
    t.string  "name",                              :default => "", :null => false
    t.text    "description", :limit => 2147483647
    t.string  "format"
    t.integer "weight",                            :default => 0,  :null => false
  end

  add_index "taxonomy_term_data", ["name"], :name => "name"
  add_index "taxonomy_term_data", ["vid", "name"], :name => "vid_name"
  add_index "taxonomy_term_data", ["vid", "weight", "name"], :name => "taxonomy_tree"

  create_table "taxonomy_term_hierarchy", :id => false, :force => true do |t|
    t.integer "tid",    :default => 0, :null => false
    t.integer "parent", :default => 0, :null => false
  end

  add_index "taxonomy_term_hierarchy", ["parent"], :name => "parent"

  create_table "taxonomy_vocabulary", :primary_key => "vid", :force => true do |t|
    t.string  "name",                               :default => "", :null => false
    t.string  "machine_name",                       :default => "", :null => false
    t.text    "description",  :limit => 2147483647
    t.integer "hierarchy",    :limit => 1,          :default => 0,  :null => false
    t.string  "module",                             :default => "", :null => false
    t.integer "weight",                             :default => 0,  :null => false
  end

  add_index "taxonomy_vocabulary", ["machine_name"], :name => "machine_name", :unique => true
  add_index "taxonomy_vocabulary", ["weight", "name"], :name => "list"

  create_table "url_alias", :primary_key => "pid", :force => true do |t|
    t.string "source",                 :default => "", :null => false
    t.string "alias",                  :default => "", :null => false
    t.string "language", :limit => 12, :default => "", :null => false
  end

  add_index "url_alias", ["alias", "language", "pid"], :name => "alias_language_pid"
  add_index "url_alias", ["source", "language", "pid"], :name => "source_language_pid"

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zip_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id"

  create_table "users", :primary_key => "uid", :force => true do |t|
    t.string  "name",             :limit => 60,         :default => "", :null => false
    t.string  "pass",             :limit => 128,        :default => "", :null => false
    t.string  "mail",             :limit => 254,        :default => ""
    t.string  "theme",                                  :default => "", :null => false
    t.string  "signature",                              :default => "", :null => false
    t.string  "signature_format"
    t.integer "created",                                :default => 0,  :null => false
    t.integer "access",                                 :default => 0,  :null => false
    t.integer "login",                                  :default => 0,  :null => false
    t.integer "status",           :limit => 1,          :default => 0,  :null => false
    t.string  "timezone",         :limit => 32
    t.string  "language",         :limit => 12,         :default => "", :null => false
    t.integer "picture",                                :default => 0,  :null => false
    t.string  "init",             :limit => 254,        :default => ""
    t.binary  "data",             :limit => 2147483647
  end

  add_index "users", ["access"], :name => "access"
  add_index "users", ["created"], :name => "created"
  add_index "users", ["mail"], :name => "mail"
  add_index "users", ["name"], :name => "name", :unique => true
  add_index "users", ["picture"], :name => "picture"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "uid", :default => 0, :null => false
    t.integer "rid", :default => 0, :null => false
  end

  add_index "users_roles", ["rid"], :name => "rid"

  create_table "variable", :primary_key => "name", :force => true do |t|
    t.binary "value", :limit => 2147483647, :null => false
  end

  create_table "views_display", :id => false, :force => true do |t|
    t.integer "vid",                                   :default => 0,  :null => false
    t.string  "id",              :limit => 64,         :default => "", :null => false
    t.string  "display_title",   :limit => 64,         :default => "", :null => false
    t.string  "display_plugin",  :limit => 64,         :default => "", :null => false
    t.integer "position",                              :default => 0
    t.text    "display_options", :limit => 2147483647
  end

  add_index "views_display", ["vid", "position"], :name => "vid"

  create_table "views_view", :primary_key => "vid", :force => true do |t|
    t.string  "name",        :limit => 128, :default => "", :null => false
    t.string  "description",                :default => ""
    t.string  "tag",                        :default => ""
    t.string  "base_table",  :limit => 64,  :default => "", :null => false
    t.string  "human_name",                 :default => ""
    t.integer "core",                       :default => 0
  end

  add_index "views_view", ["name"], :name => "name", :unique => true

  create_table "watchdog", :primary_key => "wid", :force => true do |t|
    t.integer "uid",                             :default => 0,  :null => false
    t.string  "type",      :limit => 64,         :default => "", :null => false
    t.text    "message",   :limit => 2147483647,                 :null => false
    t.binary  "variables", :limit => 2147483647,                 :null => false
    t.integer "severity",  :limit => 1,          :default => 0,  :null => false
    t.string  "link",                            :default => ""
    t.text    "location",                                        :null => false
    t.text    "referer"
    t.string  "hostname",  :limit => 128,        :default => "", :null => false
    t.integer "timestamp",                       :default => 0,  :null => false
  end

  add_index "watchdog", ["severity"], :name => "severity"
  add_index "watchdog", ["type"], :name => "type"
  add_index "watchdog", ["uid"], :name => "uid"

  create_table "webform", :primary_key => "nid", :force => true do |t|
    t.text    "confirmation",                                                     :null => false
    t.string  "confirmation_format"
    t.string  "redirect_url",                       :default => "<confirmation>"
    t.integer "status",                :limit => 1, :default => 1,                :null => false
    t.integer "block",                 :limit => 1, :default => 0,                :null => false
    t.integer "teaser",                :limit => 1, :default => 0,                :null => false
    t.integer "allow_draft",           :limit => 1, :default => 0,                :null => false
    t.integer "auto_save",             :limit => 1, :default => 0,                :null => false
    t.integer "submit_notice",         :limit => 1, :default => 1,                :null => false
    t.string  "submit_text"
    t.integer "submit_limit",          :limit => 1, :default => -1,               :null => false
    t.integer "submit_interval",                    :default => -1,               :null => false
    t.integer "total_submit_limit",                 :default => -1,               :null => false
    t.integer "total_submit_interval",              :default => -1,               :null => false
  end

  create_table "webform_component", :id => false, :force => true do |t|
    t.integer "nid",                      :default => 0, :null => false
    t.integer "cid",       :limit => 2,   :default => 0, :null => false
    t.integer "pid",       :limit => 2,   :default => 0, :null => false
    t.string  "form_key",  :limit => 128
    t.string  "name"
    t.string  "type",      :limit => 16
    t.text    "value",                                   :null => false
    t.text    "extra",                                   :null => false
    t.integer "mandatory", :limit => 1,   :default => 0, :null => false
    t.integer "weight",    :limit => 2,   :default => 0, :null => false
  end

  create_table "webform_emails", :id => false, :force => true do |t|
    t.integer "nid",                              :default => 0, :null => false
    t.integer "eid",                 :limit => 2, :default => 0, :null => false
    t.text    "email"
    t.string  "subject"
    t.string  "from_name"
    t.string  "from_address"
    t.text    "template"
    t.text    "excluded_components",                             :null => false
    t.integer "html",                :limit => 1, :default => 0, :null => false
    t.integer "attachments",         :limit => 1, :default => 0, :null => false
  end

  create_table "webform_last_download", :id => false, :force => true do |t|
    t.integer "nid",       :default => 0, :null => false
    t.integer "uid",       :default => 0, :null => false
    t.integer "sid",       :default => 0, :null => false
    t.integer "requested", :default => 0, :null => false
  end

  create_table "webform_roles", :id => false, :force => true do |t|
    t.integer "nid", :default => 0, :null => false
    t.integer "rid", :default => 0, :null => false
  end

  create_table "webform_submissions", :primary_key => "sid", :force => true do |t|
    t.integer "nid",                        :default => 0, :null => false
    t.integer "uid",                        :default => 0, :null => false
    t.integer "is_draft",    :limit => 1,   :default => 0, :null => false
    t.integer "submitted",                  :default => 0, :null => false
    t.string  "remote_addr", :limit => 128
  end

  add_index "webform_submissions", ["nid", "sid"], :name => "nid_sid"
  add_index "webform_submissions", ["nid", "uid", "sid"], :name => "nid_uid_sid"
  add_index "webform_submissions", ["sid", "nid"], :name => "sid_nid", :unique => true

  create_table "webform_submitted_data", :id => false, :force => true do |t|
    t.integer "nid",                      :default => 0,   :null => false
    t.integer "sid",                      :default => 0,   :null => false
    t.integer "cid",  :limit => 2,        :default => 0,   :null => false
    t.string  "no",   :limit => 128,      :default => "0", :null => false
    t.text    "data", :limit => 16777215,                  :null => false
  end

  add_index "webform_submitted_data", ["nid"], :name => "nid"
  add_index "webform_submitted_data", ["sid", "nid"], :name => "sid_nid"

end
