class Fort < ActiveRecord::Base

  belongs_to :user
  belongs_to :game
  has_many :trades
  has_many :legs
  has_many :trade_proposals

end
