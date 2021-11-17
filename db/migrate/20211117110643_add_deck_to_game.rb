# frozen_string_literal: true

class AddDeckToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :deck, :string
  end
end
