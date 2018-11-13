class Letter < ActiveRecord::Base
  has_many :history
  has_many :user, through: :history
end
