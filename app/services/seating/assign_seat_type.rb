# frozen_string_literal: true

module Seating
  class AssignSeatType < Service
    PARAMS = %i[column columns first_group last_group].freeze
    attr_reader(*PARAMS)

    def initialize(**params)
      init_instance_vars(params, PARAMS)
    end

    def call
      if (first_group && column == 1) || (last_group && column == columns)
        'window'
      elsif column != 1 && column != columns
        'middle'
      else
        'aisle'
      end
    end
  end
end
