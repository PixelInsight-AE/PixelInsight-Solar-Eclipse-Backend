class CreateTarots < ActiveRecord::Migration[6.1]
  def change
    create_table :tarots do |t|
      t.string :name_of_card
      t.string :card_image
      t.string :card_description
      t.string :meaning_up
      t.string :meaning_rev
      t.string :astrology
      t.string :numerology
      t.string :element
      t.string :major_minor

      t.timestamps
    end
  end
end
