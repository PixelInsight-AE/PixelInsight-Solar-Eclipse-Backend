class AddForignKeyToCards < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :cards, :users
  end
end
