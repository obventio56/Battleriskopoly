class Leg < ActiveRecord::Base
	belongs_to :trades
	belongs_to :users, through: :trades
	belongs_to :forts, through: :trades
end
