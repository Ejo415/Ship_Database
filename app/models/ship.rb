class Ship < ActiveRecord::Base
    has_many :crews
    belongs_to :user
end