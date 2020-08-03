require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe "I visit a flights show page" do
    before :each do
      @airline = Airline.create(name: "Delta")
      @flight1 = Flight.create(number: 1234, date: "01/01/01", time: "01:01:01", departure_city: "New York", arrival_city: "Denver", airline_id: @airline.id)
      @passenger1 = Passenger.create(name: "Nick", age: 18)
      @passenger2 = Passenger.create(name: "Mike", age: 45)
      @passenger3 = Passenger.create(name: "Timmy", age: 55)
      @passenger4 = Passenger.create(name: "Bob", age: 25)
      @passenger5 = Passenger.create(name: "Sue", age: 11)
      @passenger6 = Passenger.create(name: "Dan", age: 17)
      @passenger7 = Passenger.create(name: "Carl", age: 1)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger3.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger4.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger5.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger6.id)
    end

    it "shows me the flights information" do

      visit("/flights/#{@flight1.id}")

      expect(page).to have_content("Information for Flight Number: #{@flight1.number}")
      expect(page).to have_content("Date: #{@flight1.date}")
      expect(page).to have_content("Time: #{@flight1.time}")
      expect(page).to have_content("Departure City: #{@flight1.departure_city}")
      expect(page).to have_content("Arrival City: #{@flight1.arrival_city}")


      expect(page).to have_content("Airline: #{@airline.name}")
    end

    it "lists passengers by adults and minors" do

      visit("/flights/#{@flight1.id}")

      within".adults" do
        expect(page).to have_content("Adult Passengers on this flight: 4")
        expect(page).to have_content("#{@passenger1.name}")
        expect(page).to have_content("#{@passenger2.name}")
        expect(page).to have_content("#{@passenger3.name}")
        expect(page).to have_content("#{@passenger4.name}")
      end

      within".minors" do
        expect(page).to have_content("Underage Passengers on this flight: 3")
        expect(page).to have_content("#{@passenger5.name}")
        expect(page).to have_content("#{@passenger6.name}")
        expect(page).to have_content("#{@passenger7.name}")
      end
    end
  end
end
