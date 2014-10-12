class UsersController < ApplicationController

	respond_to :html, :json

	def new
		@user = User.new
	end
	
	def create

		@user = User.new(user_params)
		if @user.save
			redirect_to @user

		else

			render 'new'

		end
	end

	def show
		@user = User.find(params[:id])

		@forts = Fort.all

		@encampments = Array.new

		Encampment.find_each do |encampment|
		@encampments << encampment
		end

	end
	




	def edit

		@user = User.find(params[:id])

	end

  def update

    @user = User.find(params[:id])
 
	@fort = @user.forts.build(user_params[:forts_attributes][:"100000000000"])
	@encampment = @user.encampments.build(user_params[:encampments_attributes][:"100000000000"])
	if @trade != nil
		@trade = @user.trades.build(user_params[:trades_attributes][:"100000000000"])
		@trade.legs.build(user_params[:legs_attributes][:"100000000000"])
	end
	respond_to do |format|
		if @fort.name != nil 
			if @fort.save
			  format.html { redirect_to @user, notice: 'Fort was successfully created.' }
			  format.js   {}
			  format.json { render json: @fort, status: :updated, location: @user }
			else
			  format.html { render action: "show" }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		  end
		if @encampment.name != nil
			if @fort.save
			  format.html { redirect_to @user, notice: 'Camp was successfully created.' }
			  format.js   {}
			  format.json { render json: @fort, status: :updated, location: @user }
			else
			  format.html { render action: "show" }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
		if @trade.what != nil
			if @trade.save
			  format.html { redirect_to @user, notice: 'Camp was successfully created.' }
			  format.js   {}
			  format.json { render json: @fort, status: :updated, location: @user }
			else
			  format.html { render action: "show" }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
end
 	private

    	def user_params

        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, forts_attributes: [ :name, :xco, :yco, :territory, :ownership, :id], encampments_attributes: [ :name, :xco, :yco, :territory, :id, :date_created ], trades_attributes: [:cost, :sending_user_id, :recipient_user_id, :sending_fort_id, :recipient_fort_id ], legs_attributes: [ :what, :quantity, :sending_user_id, :recipient_user_id, :sending_fort_id, :recipient_fort_id, :durration])

   		end

	end





