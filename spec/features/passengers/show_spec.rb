require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe "I visit a passengers show page" do
    before :each do
      @airline = Airline.create(name: "Delta")
      @flight1 = Flight.create(number: 1234, date: "01/01/01", time: "01:01:01", departure_city: "New York", arrival_city: "Denver", airline_id: @airline.id)
      @flight2 = Flight.create(number: 4321, date: "02/02/02", time: "02:02:02", departure_city: "London", arrival_city: "Miami", airline_id: @airline.id)
      @flight3 = Flight.create(number: 1111, date: "03/03/03", time: "03:03:03", departure_city: "Tokyo", arrival_city: "Chicago", airline_id: @airline.id)
      Flight.create(number: 2222, date: "04/04/04", time: "04:04:04", departure_city: "Austin", arrival_city: "Quebec", airline_id: @airline.id)
      @passenger1 = Passenger.create(name: "Nick", age: 35)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger1.id)

    end

    it "shows me that passengers information" do

      visit("/passengers/#{@passenger1.id}")

      expect(page).to have_content("Name: #{@passenger1.name}")

      expect(page).to have_content("Flight Information:")

      expect(page).to have_link("Flight: #{@flight1.number}")
      expect(page).to have_link("Flight: #{@flight2.number}")
      expect(page).to have_link("Flight: #{@flight3.number}")

      click_on("Flight: #{@flight1.number}")
      expect(current_path).to eq("/flights/#{@flight1.id}")
    end

    it "displays a form to add this passenger to a flight" do
      visit("/passengers/#{@passenger1.id}")

      expect(page).to_not have_content("Flight: 2222")

      expect(page).to have_content("Add a flight:")

      fill_in :number, with: 2222

      click_on("Add Flight")

      expect(current_path).to eq("/passengers/#{@passenger1.id}")

      expect(page).to have_content("Flight: 2222")
    end
  end
end
