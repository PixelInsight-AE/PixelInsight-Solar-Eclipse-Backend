class DropUserIdFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :user_id
    
  end
end
