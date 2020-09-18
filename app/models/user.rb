class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true    
    validates :username, uniqueness: true
    has_many :ships
    #has_many :crew, through: :ships
    
end