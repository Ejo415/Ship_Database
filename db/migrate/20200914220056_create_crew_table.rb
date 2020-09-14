class CreateCrewTable < ActiveRecord::Migration
  def change
      create_table :crew do |t|
        t.string :name
        t.string :rank
        t.string :species
        t.string :affiliation
        t.integer :ship_id
      end
    end
  end
