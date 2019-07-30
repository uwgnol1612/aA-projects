class RoutesController < ApplicationController

    def index
        @goals = Goal.all
    end 
end 