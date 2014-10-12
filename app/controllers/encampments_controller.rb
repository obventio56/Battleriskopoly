class EncampmentsController < ApplicationController

	def new
		@encampment = Encampment.new
	end

	def create
		@encampment = Encampment.new(encampment_params)
		if @encampment.save
			redirect_to @user
		else
			render 'new'
		end
	end

 	private

    		def encampment_params
        		params.require(:encampment).permit(:name, :user, :territory, :date_created, :xco, :yco)
    		end

end
