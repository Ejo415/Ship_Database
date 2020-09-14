class CreateShipsTable < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.string :class
      t.string :registry
      t.string :affiliation
    end
  end
end
