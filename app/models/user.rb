class User < ActiveRecord::Base
    has_secure_password
    has_many :ships
    has_many :crew, through: :ships
end