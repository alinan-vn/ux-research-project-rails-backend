class Buyer < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :ratings
    has_many :orders
    has_many :carts
    has_many :wishlists

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: { case_sensitive: false }
end
