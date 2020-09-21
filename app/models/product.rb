class Product < ApplicationRecord
    belongs_to :seller
    has_many :buyers, through: :ratings
end
