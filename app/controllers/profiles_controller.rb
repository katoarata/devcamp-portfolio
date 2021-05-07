class ProfilesController < ApplicationController

	def index
		@profile_items=Profile.all
	end

	def new
		@profile_items=Profile.new
	end

	def create
    @profile_item=Profile.new(params.require(:profile).permit(:title, :subtitle, :body))

	    respond_to do |format|
			if @profile_item.save
				format.html { redirect_to 'http://127.0.0.1:3000/profiles/', notice: "Profile was successfully created." }
				format.json { render :index, status: :created, location: @profile }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
	    end
	end
end

