class Product < ApplicationRecord
    belongs_to :seller

    validates :seller, presence: true
    validates :title, presence: true
    validates :title, length: { maximum: 100 }
    validates :description, presence: true
    validates :description, length: {maximum: 1000 }
end
