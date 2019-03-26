class ShiftsController < ApplicationController
    def shift_params
    	params.require(:shift).permit(:shift_date, :start, :finish, :break)
    end

    def edit
        @shift = Shift.find(params[:id])
        @user = User.find(session[:user_id])
        @organisation = Organisation.find(@user.organisation_id)
    end
    
    def new
        @shift = Shift.new
        @user = User.find(session[:user_id])
        @organisation = Organisation.find(@user.organisation_id)
        @shift.update_attribute(:user_id,session[:user_id])
        @shift.update_attribute(:organisation_id,@user.organisation_id)
    end

    def update
        @shift = Shift.find(params[:id])        
        @shift.update(shift_params)
        redirect_to 'http://localhost:3000'
    end

    def create
    	@shift = Shift.new(shift_params)
    	if @shift.save
    		redirect_to 'http://localhost:3000'
    	else
    		render "new"
    	end	
    end

end
