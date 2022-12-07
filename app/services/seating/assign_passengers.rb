module Seating
  class AssignPassengers
    attr_reader :flight, :num_of_passengers

    def initialize(flight, num_of_passengers)
      @flight = flight
      @num_of_passengers = num_of_passengers
    end

    def call
      @num = 1
      seats = flight.seats.aisle.ordered +
              flight.seats.window.ordered +
              flight.seats.middle.ordered

      seats.each do |seat|
        break if @num > num_of_passengers

        seat.update(passenger_no: @num)
        @num += 1
      end
    end
  end
end
