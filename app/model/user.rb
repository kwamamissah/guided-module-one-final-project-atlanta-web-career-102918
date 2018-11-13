class User < ActiveRecord::Base
  has_many :history
  has_many :letter, through: :history
end
