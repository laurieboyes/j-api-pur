# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :rounds_won
      t.string :hand
      t.integer :herd
      t.string :tokens
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
