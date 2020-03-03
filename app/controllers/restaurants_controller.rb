class RestaurantsController < ApplicationController

    before_action :current_restaurant, only: [:show, :edit, :update, :destroy]
    
    def index
        @restaurants = Restaurant.all
    end

    def show

    end

    def new 

    end 

    def create

    end

    def edit 

    end

    def update
        
    end

    def destroy

    end

    private

    def current_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name)
    end

end
