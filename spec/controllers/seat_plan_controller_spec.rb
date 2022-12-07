# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeatPlanController, type: :controller do
  describe 'GET show' do
    describe '@flight' do
      let(:flight) { create(:flight) }

      it 'is assigned by flight number' do
        get :show, params: { id: flight.number }

        expect(assigns(:flight)).to eq(flight)
      end
    end

    describe '@seat_view' do
      let!(:flight) { create(:flight) }
      let!(:seat) do
        create(:seat,
               seat_type: 'window',
               row: 1,
               column: 1,
               group: 1,
               flight_id: flight.id)
      end

      it 'is assigned' do
        get :show, params: { id: flight.number }

        expect(assigns(:seat_view)).to eq([[[seat]]])
      end
    end
  end

  describe 'POST create' do
    let(:seating) { [[3, 2], [4, 3], [2, 3], [3, 4]].to_s }
    let(:num_of_passengers) { 30 }

    it 'creates flight and seats' do
      post :create, params: { seating:, num_of_passengers: }
      expect(response).to redirect_to action: :show, id: Flight.last.number
    end
  end
end
