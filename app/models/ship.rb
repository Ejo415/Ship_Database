class Ship < ActiveRecord::Base
    has_many :crew
    belongs_to :user
end