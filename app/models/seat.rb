# frozen_string_literal: true

class Seat < ApplicationRecord
  str_enum :seat_type, %i[window middle aisle]

  belongs_to :flight

  scope :ordered, -> { order(row: :asc, column: :asc) }
  scope :col_ordered, -> { order(column: :asc, row: :asc) }
end
