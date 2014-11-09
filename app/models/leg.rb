class Leg < ActiveRecord::Base
	belongs_to :trades
	has_many :forts, through: :trades
end
