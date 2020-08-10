class Seller < ApplicationRecord
    has_secure_password

    has_many :products
    has_many :services

end
