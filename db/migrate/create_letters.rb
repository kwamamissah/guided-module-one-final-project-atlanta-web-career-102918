class CreateLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :letters do |t|
      t.string :type
      t.string :mood
      t.string :title
      t.text :content
      
    end
  end

end
