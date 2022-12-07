# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seating::GenerateSeatPlan, type: :model do
  describe '#call' do
    let(:seating) { [[3, 2], [4, 3], [2, 3], [3, 4]] }
    let(:num_of_passengers) { 30 }
    let(:params) { { seating:, num_of_passengers: } }
    let(:service) { described_class.new(**params).call }

    it 'creates new seats' do
      expect { service }.to change(Seat, :count).by(36)
    end

    it 'creates aisle seats' do
      expect { service }.to change { Seat.aisle.size }.by(18)
    end

    it 'creates window seats' do
      expect { service }.to change { Seat.window.size }.by(6)
    end

    it 'creates middle seats' do
      expect { service }.to change { Seat.middle.size }.by(12)
    end

    it 'assigns passengers to seats' do
      expect { service }.to change { Seat.where.not(passenger_no: nil).size }.by(30)
    end
  end
end
