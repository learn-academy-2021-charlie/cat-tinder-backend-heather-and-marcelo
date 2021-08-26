class TurtlesController < ApplicationController
    
    def index
        turtles = Turtle.all
        render json: turtles
    end

end
