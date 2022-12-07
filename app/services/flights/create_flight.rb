# frozen_string_literal: true

module Flights
  class CreateFlight
    class << self
      def call
        flight = Flight.new(number: unique_number)

        flight.save
        flight
      end

      def unique_number
        loop do
          number = SecureRandom.hex(3).upcase
          break number unless Flight.find_by(number:)
        end
      end
    end
  end
end
