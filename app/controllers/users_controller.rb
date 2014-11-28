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
		@game = Game.find(@user.game_id)

		@forts = @game.forts

		@encampments = Array.new
		@user.encampments.each do |encampment|
		if encampment.game_id == @user.game_id
				@encampments << encampment
			end
		end
		@territoryColors = Array.new

		@game.attributes.each do |attr_name, attr_value|
			if attr_name != "id" && attr_name != "created_at" && attr_name != "updated_at" && attr_name != "name" && attr_name != "private" && attr_value.instance_of?(NilClass) != true
				if User.find(attr_value).color.instance_of?(NilClass) != true
					@territoryColors << Array.new
					colorUser = User.find(attr_value)
					logger.info colorUser.id
					@territoryColors[@territoryColors.length - 1] << colorUser.color[0,2].insert(0, "0x").hex
					@territoryColors[@territoryColors.length - 1] << colorUser.color[2,2].insert(0, "0x").hex
					@territoryColors[@territoryColors.length - 1] << colorUser.color[4,6].insert(0, "0x").hex
				end
			end
		end
		logger.info @territoryColors

	end
	




	def edit

		@user = User.find(params[:id])
		@games = Game.all

	end

  def update

    @user = User.find(params[:id])
	if user_params[:forts_attributes][:"100000000000"] != nil
	@fort = @user.forts.build(user_params[:forts_attributes][:"100000000000"])
	@fort.game_id = @user.game_id
	end

	if user_params[:encampments_attributes][:"100000000000"] != nil
	@encampment = @user.encampments.build(user_params[:encampments_attributes][:"100000000000"])
	@encampment.game_id = @user.game_id
	end

	if user_params[:trades_attributes][:"100000000000"] != nil
		@trade = Trade.new(user_params[:trades_attributes][:"100000000000"])
		@legs = @trade.legs.build()
		@legs = @legs.shift
		
	end

			respond_to do |format|
			if user_params[:game_id] != nil
				if @user.update_attribute(:game_id, user_params[:game_id])
					format.html { redirect_to @user }
					format.js   { redirect_to @user }
					format.json { redirect_to @user}
				end
			end

				if @fort != nil 
					if @fort.save
					  format.html { redirect_to @user, notice: 'Fort was successfully created.' }
					  format.js   {}
					  format.json { render json: @fort, status: :updated, location: @user }
					else
					  format.html { render action: "show" }
					  format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				end
				if @encampment != nil
					if @encampment.save
					  format.html { redirect_to @user, notice: 'Camp was successfully created.' }
					  format.js   {}
					  format.json { render json: @fort, status: :updated, location: @user }
					else
					  format.html { render action: "show" }
					  format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				end
				if @trade != nil
					if @trade.save && @legs.save
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

        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :game_id, forts_attributes: [ :name, :xco, :yco, :territory, :ownership, :id, :date_created, :game_id], encampments_attributes: [ :name, :xco, :yco, :territory, :id, :date_created, :game_id], trades_attributes: [:cost, :sending_user_id, :recipient_user_i, :game_id, :sending_fort_id, :what, :quantity, :recipient_fort_id, legs_attributes: [:sending_user_id, :recipient_user_id, :sending_fort_id, :recipient_fort_id, :durration], trade_proposal: [:what, :quantity, :user_id, :recipient_user_id, :fort_id, :recipient_fort_id, :durration] ])

   		end

end





