class ChangeCardImageToString < ActiveRecord::Migration[6.1]
  def up
    change_column :cards, :card_image, :string
  end
  def down
    change_column :cards, :card_image, :binary
  end
end
