class AddUserIdToCards < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :cards, :user, null: false, foreign_key: true
  end
end
