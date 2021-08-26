class TurtlesController < ApplicationController
    
    def index
        turtles = Turtle.all
        render json: turtles
    end

    def create
        turtle = Turtle.create(turtle_params)
        render json: turtle
    end


    private
    def turtle_params
        params.require(:turtle).permit(:name, :age, :enjoys)
    end

end
