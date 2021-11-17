# frozen_string_literal: true

class FixRoundsFinishedColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :roundsFinished, :rounds_finished
  end
end
