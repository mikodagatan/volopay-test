# frozen_string_literal: true

module Seating
  class GenerateSeatGroup < Service
    PARAMS = %i[flight rows columns group_index group_length column_offset].freeze

    attr_reader(*PARAMS, :first_group, :last_group)

    def initialize(**params)
      init_instance_vars(params, PARAMS)

      @first_group = group_index.zero?
      @last_group = group_index + 1 == group_length
    end

    def call
      rows.times do |row|
        row += 1
        columns.times do |column|
          column += 1
          assigned_column = column_offset + column
          seat_type = Seating::AssignSeatType.new(column:, columns:, first_group:, last_group:).call
          Seat.create(flight:, seat_type:, row:, column: assigned_column)
        end
      end
    end
  end
end
