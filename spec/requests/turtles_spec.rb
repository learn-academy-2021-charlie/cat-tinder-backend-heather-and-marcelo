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

  describe "POST /create" do
    it "creates a new turtle" do
      turtle_params = {
        turtle:  {
          name: "Michelangelo",
          age: 35,
          enjoys: "Pizza"
        }
      }

    post '/turtles', params: turtle_params
    new_turtle = Turtle.first
    expect(response).to have_http_status(200)
    expect(new_turtle.name).to eq "Michelangelo"
    expect(new_turtle.age).to eq 35
    expect(new_turtle.enjoys).to eq "Pizza"

    end
  end

  describe "PATCH /update" do
    it "update turtle" do
      turtle_params = {
        turtle:  {
          name: "Michelangelo",
          age: 35,
          enjoys: "Pizza"
        }
      }

    post '/turtles', params: turtle_params

    updated_turtle_params = {
      turtle: {
        name: "Leonardo",
        age: 15,
        enjoys: "Justice"
      }
    }

    turtle = Turtle.first

    patch "/turtles/#{turtle.id}", params: updated_turtle_params

    updated_turtle_params
    updated_turtle = Turtle.find(turtle.id)

    expect(response).to have_http_status(200)
    expect(updated_turtle.name).to eq "Leonardo"
    expect(updated_turtle.age).to eq 15
    expect(updated_turtle.enjoys).to eq "Justice"

    end
  end

  describe "DELETE /detroy" do
    it "delete turtle" do
      turtle_params = {
        turtle:  {
          name: "Michelangelo",
          age: 35,
          enjoys: "Pizza"
        }
      }

    post '/turtles', params: turtle_params

    turtle = Turtle.first
    delete "/turtles/#{turtle.id}"

    expect(response).to have_http_status(200)
    turtles = Turtle.all
    expect(turtles).to be_empty
    end
  end

  describe 'cannot create a turtle with out valid attributes' do
    it 'cannot create a turtle with out a name' do
      turtle_params = {
        turtle:  {
          age: 35,
          enjoys: "Pizza"
        }
      }
      post '/turtles', params: turtle_params
      turtle = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(turtle['name']).to include "can't be blank"

    end

    it 'cannot create a turtle with out an age' do
      turtle_params = {
        turtle:  {
          name: "Michelangelo",
          enjoys: "Pizza"
        }
      }
      post '/turtles', params: turtle_params
      turtle = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(turtle['age']).to include "can't be blank"

    end


  end

end
