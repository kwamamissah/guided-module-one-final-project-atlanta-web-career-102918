class Letter < ActiveRecord::Base
  has_many :history
  has_many :user, through: :history

  def most_viewed

  end

  def avg_rating
    ratings = History.where(letter_id: self.id).map do |history_inst|
      history_inst.rating
    end
    ratings.inject{ |sum, el| sum + el }/ ratings.size
  end


end
