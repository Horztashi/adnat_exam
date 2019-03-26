class OrganisationsController < ApplicationController
    def index
        @organisations = Organisation.all
    end

    def edit
        @organisation = Organisation.find(params[:id])
    end

    def update
        @organisation = Organisation.find(params[:id])        
        @organisation.update(organisation_params)
        redirect_to 'http://localhost:3000'
    end

    def new
        @organisation = Organisation.new
    end

    def create
    	@organisation = Organisation.new(organisation_params)
    	if @organisation.save
    		redirect_to 'http://localhost:3000'
    	else
    		render "new"
    	end	
    end

    def join
        @user = User.find(session[:user_id])   
        @user.update_attribute(:organisation_id,params[:id])
        redirect_to 'http://localhost:3000'
    end

    def leave
        @user = User.find(session[:user_id])
        @user.update_attribute(:organisation_id,nil)
        redirect_to 'http://localhost:3000'   
    end

    private

    def organisation_params
        params.require(:organisation).permit(:name, :hour_rate)
    end
end
