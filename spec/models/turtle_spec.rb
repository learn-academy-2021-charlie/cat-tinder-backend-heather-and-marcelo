require 'rails_helper'

RSpec.describe Turtle, type: :model do
  it'should have a name' do
    turtle = Turtle.create(age: 2, enjoys: 'eating watermelon')
    expect(turtle.errors[:name]).to_not be_empty
  end

  it'should have an age' do
    turtle = Turtle.create(name: 'Raphael', enjoys: 'eating watermelon')
    expect(turtle.errors[:age]).to_not be_empty
  end

  it'should have an enjoys' do
    turtle = Turtle.create(name: 'Raphael', age: 2)
    expect(turtle.errors[:enjoys]).to_not be_empty
  end

end
