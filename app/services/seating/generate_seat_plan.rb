# frozen_string_literal: true

module Seating
  class GenerateSeatPlan
    attr_reader :seating, :num_of_passengers

    def initialize(**params)
      @seating = convert_seating(params[:seating])
      @num_of_passengers = params[:num_of_passengers].to_i
    end

    def call
      Seating::GenerateSeats.new(flight, seating).call
      Seating::AssignPassengers.new(flight, num_of_passengers).call

      flight
    end

    private

    def create_flight
      errors << 'Cannot create flight' unless flight
    end

    def flight
      @flight ||= Flights::CreateFlight.call
    end

    def convert_seating(seating)
      seating.is_a?(String) ? JSON.parse(seating) : seating
    end
  end
end
