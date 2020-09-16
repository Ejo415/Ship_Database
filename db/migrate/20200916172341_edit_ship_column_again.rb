class EditShipColumnAgain < ActiveRecord::Migration
  def change
    rename_column :ships, :type, :klass 
  end
end
