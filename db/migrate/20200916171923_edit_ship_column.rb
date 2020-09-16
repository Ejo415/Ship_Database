class EditShipColumn < ActiveRecord::Migration
  def change
    rename_column :ships, :class, :type
  end
end
