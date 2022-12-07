# frozen_string_literal: true

module Seating
  class AssignSeatType
    attr_reader :column, :columns, :first_group, :last_group

    def initialize(**params)
      @column = params[:column]
      @columns = params[:columns]
      @first_group = params[:first_group]
      @last_group = params[:last_group]
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
