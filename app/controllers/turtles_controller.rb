class TurtlesController < ApplicationController

    def index
        turtles = Turtle.all
        render json: turtles
    end

    def create
        turtle = Turtle.create(turtle_params)
        if turtle.valid?
          render json: turtle
        else
          render json: turtle.errors, status: 422
        end 
    end

    def update
        turtle = Turtle.find(params[:id])
        turtle.update(turtle_params)
        render json: turtle
    end

    def destroy
        turtle = Turtle.find(params[:id])
        turtle.destroy
        render json: turtle
    end

    private
    def turtle_params
        params.require(:turtle).permit(:name, :age, :enjoys)
    end

end
