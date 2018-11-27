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

ActiveRecord::Schema.define(version: 2018_11_22_074946) do

  create_table "album_songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_songs_on_album_id"
    t.index ["song_id"], name: "index_album_songs_on_song_id"
  end

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "author_songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_songs_on_author_id"
    t.index ["song_id"], name: "index_author_songs_on_song_id"
  end

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_comments_on_song_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image_url"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_likes_on_song_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "lyrics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.boolean "accepted", default: false
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_lyrics_on_song_id"
    t.index ["user_id"], name: "index_lyrics_on_user_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "reason"
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_reports_on_song_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "singer_songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "singer_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["singer_id"], name: "index_singer_songs_on_singer_id"
    t.index ["song_id"], name: "index_singer_songs_on_song_id"
  end

  create_table "singers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_singers_on_user_id"
  end

  create_table "songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "song_url"
    t.integer "view", default: 0
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_songs_on_category_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "role", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "link"
    t.string "uid"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_videos_on_uid"
  end

  add_foreign_key "album_songs", "albums"
  add_foreign_key "album_songs", "songs"
  add_foreign_key "albums", "users"
  add_foreign_key "author_songs", "authors"
  add_foreign_key "author_songs", "songs"
  add_foreign_key "authors", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "songs"
  add_foreign_key "likes", "users"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "lyrics", "users"
  add_foreign_key "reports", "songs"
  add_foreign_key "reports", "users"
  add_foreign_key "singer_songs", "singers"
  add_foreign_key "singer_songs", "songs"
  add_foreign_key "singers", "users"
  add_foreign_key "songs", "categories"
  add_foreign_key "songs", "users"
end
