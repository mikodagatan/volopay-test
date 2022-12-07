FactoryBot.define do
  factory :seat do
    flight

    seat_type { Seat.seat_types.sample }
    row { 1 }
    column { 1 }
    passenger_no { 1 }
    group { 1 }
  end
end
