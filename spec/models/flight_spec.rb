# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flight do
  describe '#relationships' do
    it { is_expected.to have_many(:seats) }
  end
end
