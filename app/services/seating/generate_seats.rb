# frozen_string_literal: true

module Seating
  class GenerateSeats
    attr_reader :flight, :seating

    def initialize(flight, seating)
      @flight = flight
      @seating = seating
    end

    def call
      column_offset = 0

      seating.each_with_index do |(rows, columns), group_index|
        Seating::GenerateSeatGroup.new(
          flight:, rows:, columns:, group_index:, column_offset:,
          seating_length: seating.length
        ).call

        column_offset += columns
      end
    end
  end
end
