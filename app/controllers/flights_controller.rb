class FlightsController < ApplicationController

  def show
    @flight = Flight.find(params[:id])
    @adults = Passenger.where("age >= ?", 18)
    @minors = Passenger.where("age < ?", 18)
  end
end
