class ShiftsController < ApplicationController
    def shift_params
    	params.require(:user).permit(:shift_start, :shift_finish, :break_length)
    end

    def create
    	
    end

end
