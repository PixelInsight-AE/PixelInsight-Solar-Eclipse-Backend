class CreateTarotDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :tarot_decks do |t|
      t.string :name_of_card
      t.string :card_image
      t.string :card_description
      t.string :meaning_up
      t.string :meaning_rev
      t.string :astrology
      t.integer :numerology
      t.string :element
      t.boolean :major_minor
      t.boolean :user_feeling
      t.string :user_thoughts
      

      t.timestamps
    end
  end
end
