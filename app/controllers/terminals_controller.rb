class TerminalsController < ApplicationController


    before_action :current_terminal, only: [:show, :terminal_selection_id]

    def index
        @terminals = Terminal.all
    end

    def show

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
