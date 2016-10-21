class User < ApplicationRecord
    has_secure_password

    has_many :books

    validates :email, presence: true
    validates :password, presence: true
end
