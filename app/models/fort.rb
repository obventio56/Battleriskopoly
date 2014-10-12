class Fort < ActiveRecord::Base

  belongs_to :user
  has_many :trades
  has_many :legs

end
