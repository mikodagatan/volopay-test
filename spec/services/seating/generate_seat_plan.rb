# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seating::GenerateSeatPlan, type: :model do
  describe '#new' do
    let(:seating) { [[3, 2], [4, 3], [2, 3], [3, 4]] }
    let(:num_of_passengers) { 30 }

    it 'works' do
      described_class.new(seating, num_of_passengers).call
      debugger
    end
  end
end
