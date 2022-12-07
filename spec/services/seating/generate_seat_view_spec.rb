# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seating::GenerateSeatView, type: :model do
  describe '#call' do
    let(:seating) { [[3, 2], [4, 3], [2, 3], [3, 4]] }
    let(:num_of_passengers) { 30 }
    let(:params) { { seating:, num_of_passengers: } }
    let(:flight) { Seating::GenerateSeatPlan.new(**params).call }
    let(:service) { described_class.new(flight).call }

    it 'splits data in seat groups' do
      expect(service.length).to eq(4)
    end

    it 'splits seat groups into columns' do
      expect(service.first.length).to eq(3)
    end

    it 'splits columns into data rows' do
      expect(service.first.first.length).to eq(2)
    end

    it 'shows kind of seat' do
      expect(service.first.first.first.seat_type).to eq('window')
    end
  end
end
