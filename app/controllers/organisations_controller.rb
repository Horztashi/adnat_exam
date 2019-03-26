class OrganisationsController < ApplicationController
    def organisation_params
    	params.require(:user).permit(:name, :hour_rate)
    end

    def create
    	@organisation = Organisation.new(params[:organisation])
    	if @organisation.save
    		redirect to @organisation
    	else
    		render "new"
    	end	
    end
end
