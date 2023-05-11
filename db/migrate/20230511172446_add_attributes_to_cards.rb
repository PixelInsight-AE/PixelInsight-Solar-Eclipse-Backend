class AddAttributesToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :name_of_card, :string
    add_column :cards, :card_image, :binary
    add_column :cards, :card_description, :string
    add_column :cards, :meaning_up, :string
    add_column :cards, :meaning_rev, :string
    add_column :cards, :astrology, :string
    add_column :cards, :numerology, :integer
    add_column :cards, :element, :string
    add_column :cards, :major_minor, :boolean
    add_column :cards, :user_feeling, :boolean
    add_column :cards, :user_thoughts, :string
  end
end
