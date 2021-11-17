# frozen_string_literal: true

class AddMarketToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :market, :string
  end
end
