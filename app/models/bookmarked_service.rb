class BookmarkedService < ApplicationRecord
    belongs_to :service
    belongs_to :buyer
end
