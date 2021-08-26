require 'rails_helper'

RSpec.describe "Turtles", type: :request do
  describe "GET /index" do
    it "gets a list of turtles" do
      Turtle.create name: 'Another name', age: 5, enjoys: 'Walks'

      # Make a request
      get '/turtles'

      turtle = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(turtle.length).to eq 1
    end
  end
end
