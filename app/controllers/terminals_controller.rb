class TerminalsController < ApplicationController


    before_action :current_terminal, only: [:show, :terminal_selection_id]

    def index
        @terminals = Terminal.all
    end

    def show
        if @terminal.number 
        @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Terminal+#{@terminal.number}+at+#{@terminal.iata}&key=AIzaSyBE_4_oQR77YTzAD4d4Bh2LBWbGdB_mqzc")
        else 
        @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Terminal+at+#{@terminal.iata}&key=AIzaSyBE_4_oQR77YTzAD4d4Bh2LBWbGdB_mqzc")

        end
        # byebug
    end

    def terminal_selection_id
        redirect_to terminal_path(@terminal)
    end

    private

    def current_terminal
        @terminal = Terminal.find(params[:id])
    end

    def terminal_params
        params.require(:terminal).permit(:name)
    end
    
end
