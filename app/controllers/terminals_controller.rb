class TerminalsController < ApplicationController


    before_action :current_terminal, only: [:show]

    def index
        @terminals = Terminal.all
    end

    def show

    end

    private

    def current_terminal
        @terminal = Terminal.find(params[:id])
    end

    def terminal_params
        params.require(:terminal).permit(:name)
    end
end
