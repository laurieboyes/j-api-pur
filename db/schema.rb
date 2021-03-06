# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_211_117_152_732) do
  create_table 'games', force: :cascade do |t|
    t.integer 'rounds_finished'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'deck'
    t.string 'market'
  end

  create_table 'players', force: :cascade do |t|
    t.string 'rounds_won'
    t.string 'hand'
    t.integer 'herd'
    t.string 'tokens'
    t.integer 'game_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['game_id'], name: 'index_players_on_game_id'
  end

  add_foreign_key 'players', 'games'
end
