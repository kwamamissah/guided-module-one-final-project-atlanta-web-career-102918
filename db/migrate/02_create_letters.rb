class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.string :kind
      t.string :mood
      t.string :title
      t.text :content

    end
  end

end
