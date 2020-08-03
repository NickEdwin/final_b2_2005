Rails.application.routes.draw do

  get "/flights/:id", to: "flights#show"

  get "/passengers/:id", to: "passengers#show"
  post "/passengers/:id/flights/new", to: "flight_passengers#create"

end
