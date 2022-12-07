# frozen_string_literal: true

module Flights
  class CreateFlight
    class << self
      def call
        flight = Flight.new(number: SecureRandom.hex(3).upcase)

        return flight if flight.save

        false
      end
    end
  end
end
