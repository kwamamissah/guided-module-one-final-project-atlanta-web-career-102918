class CreateHistories
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :letter_id
      t.integer :letter_rating
    end
  end
end
