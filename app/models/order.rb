class Order < ApplicationRecord
    belongs_to :buyer
    belongs_to :cart
end