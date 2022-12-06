# frozen_string_literal: true

class Seat < ApplicationRecord
  str_enum :seat_type, %i[window middle aisle]

  belongs_to :flight
end
