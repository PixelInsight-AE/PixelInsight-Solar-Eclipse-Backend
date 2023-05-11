class AddCardId < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :card_id, :integer
  end
end
