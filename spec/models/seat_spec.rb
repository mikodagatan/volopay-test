# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seat do
  describe '#relationships' do
    it { is_expected.to belong_to(:flight) }
  end

  describe '.seat_types' do
    it 'is window, middle, and aisle' do
      expect(described_class.seat_types).to eq(%w[window middle aisle])
    end
  end

  describe '.ordered' do
    before do
      create(:seat, row: 1, column: 1)
      create(:seat, row: 2, column: 1)
    end

    it 'orders the seats by row' do
      expect(described_class.ordered.last.row).to eq(2)
    end
  end

  describe '.col_ordered' do
    before do
      create(:seat, row: 1, column: 1)
      create(:seat, row: 2, column: 1)
      create(:seat, row: 1, column: 2)
    end

    it 'orders the seats by column' do
      expect(described_class.col_ordered.last.row).to eq(1)
      expect(described_class.col_ordered.last.column).to eq(2)
    end
  end
end
