# frozen_string_literal: true

class Flight < ApplicationRecord
  has_many :seats
end
