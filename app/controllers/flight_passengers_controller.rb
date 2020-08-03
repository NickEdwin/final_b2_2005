class FlightPassengersController < ApplicationController

 def create
   @flight = Flight.find_by(number: params[:number])
   @passenger = Passenger.find(params[:id])
   @flight_passenger =  FlightPassenger.create(flight_id: @flight.id, passenger_id: @passenger.id)
   redirect_to "/passengers/#{@passenger.id}"
 end
end
