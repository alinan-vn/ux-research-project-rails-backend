class Review < ApplicationRecord
    belongs_to :product
    belongs_to :buyer
    belongs_to :rating
end