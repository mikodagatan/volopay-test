class SeatPlanController < ApplicationController
  def show
    @flight = Flight.find_by(number: params[:id])
    @seat_view = Seating::GenerateSeatView.new(@flight).call
  end

  def new; end

  def create
    service = Seating::GenerateSeatPlan.new(**seat_plan_params)
    flight = service.call
    redirect_to seat_plan_path(flight.number)
  end

  private

  def seat_plan_params
    params.permit(:seating, :num_of_passengers).to_h
  end
end
