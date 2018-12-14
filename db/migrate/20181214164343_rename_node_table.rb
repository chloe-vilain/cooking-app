class RenameNodeTable < ActiveRecord::Migration[5.2]
  def change
        rename_table :nodes, :restaurants
  end
end
