class User < ApplicationRecord
    has_secure_password

    has_many :collections

    validates :username, uniqueness: true
end

