class Ship < ActiveRecord::Base
    has_many :crews
    belongs_to :user
    validates :name, presence: true
    validates :klass, presence: true
    validates :registry, presence: true
    validates :affiliation, presence: true
end