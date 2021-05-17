class ProfilesController < ApplicationController

	def index
		@profile_items=Profile.ruby_on_rails_profile_items
	end

	def angular
		@angular_profile_items=Profile.angular
		
	end

	def new
		@profile_items=Profile.new
	end

	def create
    @profile_item=Profile.new(params.require(:profile).permit(:title, :subtitle, :body))

	    respond_to do |format|
			if @profile_item.save
				format.html { redirect_to 'http://127.0.0.1:3000/profiles/', notice: "Profile was successfully created." }
			else
				format.html { render :new, status: :unprocessable_entity }
			end
	    end
	end

	def edit
		@profile_item=Profile.find(params[:id])
	end

	def update
		@profile_item=Profile.find(params[:id])
    	respond_to do |format|
	      if @profile_item.update(params.require(:profile).permit(:title, :subtitle, :body))
	        format.html { redirect_to 'http://127.0.0.1:3000/profiles/', notice: "Profile was successfully updated." }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	      end
    	end
  	end
  	def show
  		@profile_item=Profile.find(params[:id])
  	end

  	def destroy
  	@profile_item=Profile.find(params[:id])
    @profile_item.destroy
	    respond_to do |format|
	      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
	    end
  	end
end

