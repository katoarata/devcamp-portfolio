class ProfilesController < ApplicationController

	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
	layout "profile"
	def index
		@profile_items=Profile.all
	end

	def angular
		@angular_profile_items=Profile.angular
	end

	def new
		@profile_item=Profile.new
        3.times{@profile_item.technologies.build}
	end

	def create
    @profile_item=Profile.new(profile_params)

	    respond_to do |format|
			if @profile_item.save
				format.html { redirect_to 'http://127.0.0.1:5000/profiles/', notice: "Profile was successfully created." }
			else
				format.html { render :new, status: :unprocessable_entity }
			end
	    end
	end

	def edit
		@profile_item=Profile.find(params[:id])
		# 3.times{@profile_item.technologies.build}

	end

	def update
		@profile_item=Profile.find(params[:id])
    	respond_to do |format|
	      if @profile_item.update(profile_params)
	        format.html { redirect_to 'http://127.0.0.1:5000/profiles/', notice: "Profile was successfully updated." }
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
    
      private def profile_params
        params.require(:profile).permit(:title, :subtitle, :body, technologies_attributes: [:name])
      end

end

