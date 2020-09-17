class UpdateCrewTableName < ActiveRecord::Migration
  def change
    rename_table :crew, :crews
  end
end
