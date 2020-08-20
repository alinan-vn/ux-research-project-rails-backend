class BookmarkedProduct < ApplicationRecord
    belongs_to :product
    belongs_to :buyer

    validates :product, presence: true
    validates :buyer, presence: true
end
