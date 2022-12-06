# frozen_string_literal: true

module Seating
  class Generate
    attr_reader :seating, :num_of_passengers

    def initialize(seating, num_of_passengers)
      @seating = seating
      @num_of_passenger = num_of_passengers
    end

    def call; end
  end
end
