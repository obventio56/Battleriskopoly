class FortsController < ApplicationController

	def new
		@fort = Fort.new
	end

	def create
		@fort = Fort.new(fort_params)
		if @fort.save
			redirect_to @user
		else
			render 'new'
		end
	end

 	private

    		def fort_params
        		params.require(:fort).permit(:name, :xco, :yco, :ownership, :territory)
    		end

end
