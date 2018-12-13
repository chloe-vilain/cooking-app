class ChangeNodeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
      change_column :nodes, :description, :text
  end
end
