module Seating
  class GenerateSeatView
    attr_reader :flight, :seats

    def initialize(flight)
      @flight = flight
      @seats = flight.seats.ordered
    end

    def call
      group_data = []
      groups = @seats.pluck(:group).uniq.sort

      groups.each do |group_number|
        col_data = []
        group_seats = @seats.where(group: group_number).col_ordered
        columns = group_seats.pluck(:column).uniq.sort
        columns.each do |col_number|
          col_data << @seats.where(column: col_number).col_ordered
        end

        group_data << col_data
      end

      group_data
    end
  end
end
