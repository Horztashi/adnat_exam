class HomeController < ApplicationController
 	def index
	  	@user = User.find(session[:user_id])
	    if @user.organisation_id != nil
	      @organisation = Organisation.find(@user.organisation_id)
	    else
	      @organisations = Organisation.all
	    end

	    # Get all Personal Shifts
	    counter = 0
	    @user_shifts = Array.new
	    user_shiftsArr = Shift.where(user_id: session[:user_id])
	    user_shiftsArr.each do |shiftArr|
	    	
	    	organisation 	= Organisation.find(shiftArr[:organisation_id])
	    	time_diff 		= ((shiftArr[:finish] - shiftArr[:start])/3600)
	    	cost			= (time_diff - (shiftArr[:break]/60)) * organisation.hour_rate
	    	
	    	shift = Hash.new
	    	shift['id']					= shiftArr[:id]
	    	shift['organisation']		= organisation.name
	    	shift['shift_date']			= shiftArr[:shift_date]
	    	shift['start']				= shiftArr[:start]
	    	shift['finish']				= shiftArr[:finish]
	    	shift['break']				= shiftArr[:break]
	    	shift['worked']				= time_diff
	    	shift['cost']				= cost
	    	@user_shifts[counter]	= shift
	    	counter = counter + 1
	    end

	    # Get all Organisational Shifts
	    counter = 0
	    @organisation_shifts	= Array.new
	    organisation_shiftArr	= Shift.where(organisation_id: @user.organisation_id)
	    organisation_shiftArr.each do |shiftArr|
	    	
	    	user 			= User.find(shiftArr[:user_id])
	    	organisation	= Organisation.find(shiftArr[:organisation_id])
	    	time_diff		= ((shiftArr[:finish] - shiftArr[:start])/3600)
	    	cost			= (time_diff - (shiftArr[:break]/60)) * organisation.hour_rate
	    	
	    	shift = Hash.new
	    	shift['id']						= shiftArr[:id]
	    	shift['nameemail']				= "#{user.name} (#{user.email})"
	    	shift['shift_date']				= shiftArr[:shift_date]
	    	shift['start']					= shiftArr[:start]
	    	shift['finish']					= shiftArr[:finish]
	    	shift['break']					= shiftArr[:break]
	    	shift['worked']					= time_diff
	    	shift['cost']					= cost
	    	@organisation_shifts[counter]	= shift
	    	counter = counter + 1
	    end
	end
end
