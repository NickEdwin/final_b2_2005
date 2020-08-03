require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe "I visit a flights show page" do
    before :each do
      @airline = Airline.create(name: "Delta")
      @flight1 = Flight.create(number: 1234, date: "01/01/01", time: "01:01:01", departure_city: "New York", arrival_city: "Denver", airline_id: @airline.id)
      @passenger1 = Passenger.create(name: "Nick", age: 35)
      @passenger2 = Passenger.create(name: "Mike", age: 45)
      @passenger3 = Passenger.create(name: "Timmy", age: 55)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger3.id)

    end

    it "shows me the flights information" do

      visit("/flights/#{@flight1.id}")

      expect(page).to have_content("Information for Flight Number: #{@flight1.number}")
      expect(page).to have_content("Date: #{@flight1.date}")
      expect(page).to have_content("Time: #{@flight1.time}")
      expect(page).to have_content("Departure City: #{@flight1.departure_city}")
      expect(page).to have_content("Arrival City: #{@flight1.arrival_city}")


      expect(page).to have_content("Airline: #{@airline.name}")
      expect(page).to have_content("Passengers on this flight:")
      expect(page).to have_content("#{@passenger1.name}")
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to have_content("#{@passenger3.name}")
    end
  end
end
