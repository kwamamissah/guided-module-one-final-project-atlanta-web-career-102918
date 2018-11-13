class User < ActiveRecord::Base
  binding.pry
  has_many :history
  has_many :letter, through: :history
end
