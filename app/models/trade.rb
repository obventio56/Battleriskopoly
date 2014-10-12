class Trade < ActiveRecord::Base
	belongs_to :fort
	belongs_to :user
	has_many :legs
end
