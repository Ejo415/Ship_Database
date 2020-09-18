class Crew < ActiveRecord::Base
    belongs_to :ship
    validates :name, presence: true
    validates :rank, presence: true
    validates :species, presence: true
    validates :affiliation, presence: true
end