class Buyer < ApplicationRecord
    has_secure_password

    has_many :bookmarked_products
    has_many :bookmarked_services
    has_many :products, through: :bookmarked_products
    has_many :services, through: :bookmarked_services
    has_many :product_orders
    has_many :service_orders
    has_many :shopping_carts

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
end
