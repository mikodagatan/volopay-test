# frozen_string_literal: true

class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.references :flight, null: false, foreign_key: true
      t.string :seat_type
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end
end
