# frozen_string_literal: true

module Seating
  class GenerateSeatPlan
    attr_reader :seating, :num_of_passengers

    def initialize(seating, num_of_passengers)
      @seating = seating
      @num_of_passenger = num_of_passengers
    end

    def call
      Seating::GenerateSeats.new(flight, seating).call
    end

    private

    def flight
      @flight ||= Flights::CreateFlight.call
    end
  end
end
