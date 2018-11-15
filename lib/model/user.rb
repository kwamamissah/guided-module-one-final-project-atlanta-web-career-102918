class User < ActiveRecord::Base
  has_many :history
  has_many :letter, through: :history

  def review_history
    History.where(user_id: self.id).map do |history_inst|
      history_inst.letter_id
    end
  end

  def letter_name
    puts "Here are the letters you received in the past"
    letter_id = review_history.each do|l|

      name = Letter.find(l)
      puts name.title
    end
    "(:"
  end

  def fav_letters
    favs = History.where("user_id = ? AND rating > ?", self.id, 3)
    favs.each do |fav|
      puts Letter.find(fav.letter_id).title
    end
  end



end
